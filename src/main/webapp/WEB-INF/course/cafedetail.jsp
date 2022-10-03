<%--
  Created by IntelliJ IDEA.
  User: hyeongjoon
  Date: 2022/10/03
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
    blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
    img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u,
    i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption,
    tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure,
    figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time,
    mark, audio, video
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-style: normal;
    }

    div
    {
        display: block;
    }

    main
    {
        display: block;
    }

    section
    {
        display: block;
    }

    .hj_main
    {
        padding: 0px 0px 220px;
        min-width: 1200px;
        min-height: calc(100vh - 400px);
    }

    .hj_mainimg
    {
        position: relative;
        width: 1200px;
        margin: 0px auto;
    }

    .hj_mainimg > img:first-child
    {
        width: 100%;
        height: 400px;
        border-radius: 8px;
        margin: 40px 0px;
    }

    .hj_bmain
    {
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        margin: 70px 0px 0px;
    }

    .hj_bhead
    {
        max-width: 800px;
        width: 800px;
        margin-right: 80px;
    }

    .hj_bbody
    {
        margin-bottom: 65px;
    }

    .hj_bbody > #title
    {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
    }

    .hj_bbody > #title > p
    {
        font-weight: 500;
        font-size: 24px;
        line-height: 1.5em;
    }

    p {
        display: block;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
<main class="hj_main" id="contents" style="margin-bottom: 66px;" media="web">
  <section direction="vertical" class="hj_mainimg">
      <img src="${dto.photo}">
  </section>

    <div class="hj_bmain">
        <div class="hj_bhead">
            <div class="hj_bbody">
                <div id="title">
                    <p>${dto.title}</p>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
