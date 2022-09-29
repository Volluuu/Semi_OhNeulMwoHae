package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.service.CafeService;
import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller

public class CafeController {

    @Autowired
    CafeServiceInter cafeService;

    @GetMapping("/courseboard/list")
    public String cafeBoard(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "cafecolumn", required = false) String sc,
            @RequestParam(value = "cafeword", required = false) String sw,
            Model model)
    {
        //페이징 처리에 필요한 변수들
        //전체 갯수
        int totalCount=cafeService.selectTotalCount(sc, sw);
        int perPage=10;//한페이지당 보여질 글의 갯수
        int perBlock=4;//한블럭당 보여질 페이지의 갯수
        int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int startPage;//각블럭당 보여질 시작페이지
        int endPage;//각 블럭당 보여질 끝페이지
        int totalPage;//총 페이지수
        int no;//각 페이지당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

        //각 블럭당 보여질 시작페이지
        //perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
        startPage=(currentPage-1)/perBlock*perBlock+1;
        endPage=startPage+perBlock-1;
        //총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if(endPage>totalPage)
            endPage=totalPage;

        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum=(currentPage-1)*perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no=totalCount-(currentPage-1)*perPage;

        //페이지에서 보여질 글만 가져오기
        List<CafeDto> list=cafeService.selectPagingList(sc, sw, startNum, perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/bit/course/courseboard";
    }
    //업로드
    @GetMapping("/admin/insert")//관리자 페이지 생성후 mapping~!~!~!!~
    public String insert(CafeDto dto, int currentPage, List<MultipartFile> upload, HttpServletRequest request) {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");//관리자 페이지 생성후 mapping~!~!~!!~
        System.out.println(path);//값이 정상적으로 올라가면 삭제필요~!~!
        System.out.println(upload.size());//값이 정상적으로 올라가면 삭제필요~!~!

        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다
        if (upload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto("no");
        } else {
            String photo = "";
            int idx = 1;
            for (MultipartFile multi : upload) {
                //파일명이 현재 날짜로 변경 후 ,로 연결
                String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo += newName + ",";
                try {
                    multi.transferTo(new File(path + "/" + newName));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                } catch (IllegalStateException e) {
                    throw new RuntimeException(e);
                }

            }
            //마지막 컴마제거
            photo = photo.substring(0, photo.length() - 1);
            //dto에 저장
            dto.setPhoto(photo);
        }
        cafeService.insertCafe(dto);
        //삭제후 보던 페이지로 이동
        return "redirect:list?currentPage=" + currentPage;
    }

    @GetMapping("/admin/delete")//관리자 페이지 생성후 mapping~!~!~!!~
    public String delete(int cafe_num, int currentPage) {
        cafeService.deleteCafe(cafe_num);
        //삭제후 보던 페이지로 이동
        return "redirect:list?currentPage=" + currentPage;
    }

    @PostMapping("/admin/update")//관리자 페이지 생성후 mapping~!~!~!!~
    public String update(CafeDto dto, int currentPage, List<MultipartFile> upload, HttpServletRequest request) {
        //업로드 경로
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);//정상 빌드 확인 후 삭제~!

        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다
        if (upload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto("no");
        } else {
            String photo = "";
            int idx = 1;
            for (MultipartFile multi : upload) {
                //파일명이 현재 날짜로 변경 후 ,로 연결
                String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo += newName + ",";
                try {
                    multi.transferTo(new File(path + "/" + newName));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                } catch (IllegalStateException e) {
                    throw new RuntimeException(e);
                }

            }
            //마지막 컴마제거
            photo = photo.substring(0, photo.length() - 1);
            //dto에 저장
            dto.setPhoto(photo);
        }
        cafeService.updateCafe(dto);
        return "redirect:detail?currentPage="+currentPage+"&cafe_num="+dto.getCafe_num();
    }
}
