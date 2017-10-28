<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html>
    <%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@taglib  prefix="form"   uri="http://www.springframework.org/tags/form" %>
    <%@taglib  prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <%@include file='/WEB-INF/template/template_variables.jspf' %>
    <html lang="${lang}">
        <%@include file='/WEB-INF/template/head.jspf' %>
        <body id="contrast-finder-page">
            <div class="container">

                <%-- ===== HEADER ========================================================================================= --%>
                <%@include file='/WEB-INF/template/header.jspf' %>

                <%-- Firefox addon --%>
                <%-- <%@include file='/WEB-INF/template/cf-message.jspf' %>--%>

                <%-- DEBUG   contrast-finder.conf  --%>
                <c:if test="${env == 'debug'}">
                    <div style="background-color:pink; padding: 0.4em;">
                        env              <strong> ${env}                        </strong> <br>
                        defaultAlgorithm <strong> ${defaultAlgorithm}           </strong> <br>
                        cookie.algo      <strong> ${cookie.algo.value}          </strong> <br>
                        algo             <strong> ${algo}                       </strong> <br>
                    </div>
                </c:if>


                <%-- ===== FORM ========================================================================================= --%>
                <div id="set-up-form" class="row">
                    <div class="col-lg-12">
                        <%-- <h2><fmt:message key="form.fillInFields"/></h2> --%>
                        <c:set var="actionUrl">
                            <c:url value="result.html"></c:url>
                        </c:set>
                        <form:form class="form-horizontal" name="formulaire" commandName="colorModel" method="GET"  action="${actionUrl}">

                            <%-- Foregound --%>
                            <c:set var="foregroundOnError">
                                <form:errors path="foreground"/>
                            </c:set>
                            <c:choose>
                                <c:when test="${not empty foregroundOnError}">
                                    <c:set var="foregroundOnError" value="has-error"/>
                                    <c:set var="foregroundSampleClass"  value=""/>
                                    <c:set var="foregroundSampleStyle"  value="background-color:rgba(0,0,0,0);"/>
                                    <c:set var="foregroundInvalidStyle" value="display:inherit;"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="foregroundSampleClass"  value="color-sample sample-bordered"/>
                                    <c:set var="foregroundSampleStyle"  value="background-color:${colorModel.foreground};"/>
                                    <c:set var="foregroundInvalidStyle" value="display:none;"/>
                                </c:otherwise>
                            </c:choose>
                            <div class="form-group ${foregroundOnError}">
                                <label for="foreground-input" class="col-lg-3 control-label"><fmt:message key="form.foregroundColor"/></label>
                                <div class="col-lg-4">
                                    <form:input path="foreground"       required="required"
                                                id="foreground-input"   type="text"
                                                aria-describedby="foreground-sample-invalid  help-block-colors"
                                                class="form-control form-color-input"/>
                                </div>
                                <div id="foreground-sample" class="col-lg-2 ${foregroundSampleClass}" style="${foregroundSampleStyle}">
                                    <div id="foreground_ColorPicker" class="colorPickerContainer">
                                        <input id="foreground_imputColorPicker"
                                               tabindex="-1"
                                               type="color"
                                               aria-label="<fmt:message key="form.foregroundColor"/>"
                                               value="${foregroundHEX}">
                                        <!-- License CC-By 3.0
                                                Icon by Denis Klyuchnikov from the Noun Project
                                                https://thenounproject.com/denis.klyuchnikov.1/uploads/?i=542309
                                        -->
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                             aria-hidden="true"
                                             viewBox="0 0 24 30" width="18" >
                                            <path fill="rgb(0, 0, 0)" d="M1 20.303c0 1.467 1.125 2.667 2.5 2.667S6 21.77 6 20.303c0-1.467-2.5-5.333-2.5-5.333S1 18.836 1 20.303zm20.085-10.54l-5.877-5.878c-.392-.392-.86-.658-1.36-.798l.92-.92c.316-.315.315-.82.003-1.133-.31-.314-.82-.31-1.13.003L9.825 4.85c-.014.015-.028.03-.04.046l-4.87 4.866c-1.22 1.22-1.22 3.197 0 4.416l5.878 5.877c1.22 1.22 3.2 1.22 4.42 0l5.876-5.877c1.22-1.22 1.22-3.197 0-4.416zM5.6 12c0-.39.15-.78.447-1.077l5.876-5.876c.596-.596 1.558-.596 2.154 0l5.876 5.876c.298.298.447.687.447 1.077H5.6z"></path>
                                        </svg>
                                    </div>
                                    <span id="foreground-sample-invalid" style="${foregroundInvalidStyle}" class="invalid-color"><fmt:message key="form.invalidColor"/></span>
                                </div>
                            </div>
                            <%-- Background --%>
                            <c:set var="backgroundOnError">
                                <form:errors path="background"/>
                            </c:set>
                            <c:choose>
                                <c:when test="${not empty backgroundOnError}">
                                    <c:set var="backgroundOnError" value="has-error"/>
                                    <c:set var="backgroundSampleClass"  value=""/>
                                    <c:set var="backgroundSampleStyle"  value="background-color:rgba(0,0,0,0);"/>
                                    <c:set var="backgroundInvalidStyle" value="display:inherit;"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="backgroundSampleClass"  value="color-sample sample-bordered"/>
                                    <c:set var="backgroundSampleStyle"  value="background-color:${colorModel.background};"/>
                                    <c:set var="backgroundInvalidStyle" value="display:none;"/>
                                </c:otherwise>
                            </c:choose>
                            <div class="form-group ${backgroundOnError}">
                                <label for="background-input" class="col-lg-3 control-label"><fmt:message key="form.backgroundColor"/></label>
                                <div class="col-lg-4">
                                    <form:input path="background"       required="required"
                                                id="background-input"   type="text"
                                                aria-describedby="background-sample-invalid  help-block-colors"
                                                class="form-control form-color-input"/>
                                    <span id="help-block-colors" class="help-block"><fmt:message key="form.help"/>
                                    <hr> <a href="#color-name-liste"
                                            class="js-modal button"
                                            data-modal-prefix-class="simple"
                                            data-modal-text="Bonjour tout le monde cccccccccccccccccccccccccccccc"
                                            data-modal-title="Titre ccccccccccccccccccccccccccc"
                                            data-modal-close-text="Fermer ccccccccccccccccccccccccccc"
                                            data-modal-close-title="Fermer cette fenêtre ccccccccccccccccccccccc"
                                            id="label_modal_2"
                                            aria-haspopup="dialog"> color name</a>
<button class="js-modal button"
        data-modal-prefix-class="simple"
        data-modal-text="red, <br> blue<br> green<br> rebecca purple<br> <br>...<br><br><br>blue<br> green<br> rebecca purple<br> <br>.."
        data-modal-title="CSS color keywords"
        data-modal-close-text="Fermer"
        data-modal-close-title="Fermer cette fenêtre"
        id="label_modal_1"
        aria-haspopup="dialog">CSS color keywords</button>
                                        <button class="js-modal button"
                                                data-modal-prefix-class="simple-left"
                                                data-modal-content-id="CSS_colorNames_data"
                                                data-modal-title="CSS color keywords"
                                                data-modal-close-text="Fermer"
                                                data-modal-close-title="Fermer cette fenêtre"
                                                id="label_modal_2"
                                                aria-haspopup="dialog">CSS color keywords v2</button>
                                        <button class="js-modal button"
                                                data-modal-prefix-class="simple"
                                                data-modal-content-id="CSS_colorNames_data"
                                                data-modal-title="CSS color keywords"
                                                data-modal-close-text="Fermer"
                                                data-modal-close-title="Fermer cette fenêtre"
                                                id="label_modal_3"
                                                aria-haspopup="dialog">CSS color keywords v3</button>
                                    </span>


                                    <div id="CSS_colorNames_data" class="hidden">
                                        <table>
                                            <thead>
                                            <tr>
                                                <th scope="col">Specification</th>
                                                <th scope="col">Color</th>
                                                <th scope="col">Keyword</th>
                                                <th scope="col">RGB hex values</th>
                                                <th scope="col">Live</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr style="position: relative;">
                                                <td rowspan="16"><a href="http://www.w3.org/TR/CSS1/" class="external external-icon" hreflang="en" title="The 'CSS Level&nbsp;1' specification" lang="en">CSS Level&nbsp;1</a></td>
                                                <td style="background: #000;">&nbsp;</td>
                                                <td style="text-align: center;"><code>black</code></td>
                                                <td><code>#000000</code></td>
                                                <td style="background: black;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #C0C0C0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>silver</code></td>
                                                <td><code>#c0c0c0</code></td>
                                                <td style="background: silver;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #808080;">&nbsp;</td>
                                                <td style="text-align: center;"><code>gray</code></td>
                                                <td><code>#808080</code></td>
                                                <td style="background: gray;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #FFF;">&nbsp;</td>
                                                <td style="text-align: center;"><code>white</code></td>
                                                <td><code>#ffffff</code></td>
                                                <td style="background: white;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #800000;">&nbsp;</td>
                                                <td style="text-align: center;"><code>maroon</code></td>
                                                <td><code>#800000</code></td>
                                                <td style="background: maroon;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #F00;">&nbsp;</td>
                                                <td style="text-align: center;"><code>red</code></td>
                                                <td><code>#ff0000</code></td>
                                                <td style="background: red;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #800080;">&nbsp;</td>
                                                <td style="text-align: center;"><code>purple</code></td>
                                                <td><code>#800080</code></td>
                                                <td style="background: purple;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #F0F;">&nbsp;</td>
                                                <td style="text-align: center;"><code>fuchsia</code></td>
                                                <td><code>#ff00ff</code></td>
                                                <td style="background: fuchsia;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #008000;">&nbsp;</td>
                                                <td style="text-align: center;"><code>green</code></td>
                                                <td><code>#008000</code></td>
                                                <td style="background: green;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #0F0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lime</code></td>
                                                <td><code>#00ff00</code></td>
                                                <td style="background: lime;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #808000;">&nbsp;</td>
                                                <td style="text-align: center;"><code>olive</code></td>
                                                <td><code>#808000</code></td>
                                                <td style="background: olive;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #FF0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>yellow</code></td>
                                                <td><code>#ffff00</code></td>
                                                <td style="background: yellow;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #000080;">&nbsp;</td>
                                                <td style="text-align: center;"><code>navy</code></td>
                                                <td><code>#000080</code></td>
                                                <td style="background: navy;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #00F;">&nbsp;</td>
                                                <td style="text-align: center;"><code>blue</code></td>
                                                <td><code>#0000ff</code></td>
                                                <td style="background: blue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #008080;">&nbsp;</td>
                                                <td style="text-align: center;"><code>teal</code></td>
                                                <td><code>#008080</code></td>
                                                <td style="background: teal;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #0FF;">&nbsp;</td>
                                                <td style="text-align: center;"><code>aqua</code></td>
                                                <td><code>#00ffff</code></td>
                                                <td style="background: aqua;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td><a href="http://www.w3.org/TR/CSS2/" class="external external-icon" hreflang="en" title="The 'CSS Level&nbsp;2 (Revision&nbsp;1)' specification" lang="en">CSS Level&nbsp;2 (Revision&nbsp;1)</a></td>
                                                <td style="background: #FFA500;">&nbsp;</td>
                                                <td style="text-align: center;"><code>orange</code></td>
                                                <td><code>#ffa500</code></td>
                                                <td style="background: orange;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="130"><a href="https://drafts.csswg.org/css-color-3/" class="external external-icon" hreflang="en" title="The 'CSS Color Module Level&nbsp;3' specification" lang="en">CSS Color Module Level&nbsp;3</a></td>
                                                <td style="background: #f0f8ff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>aliceblue</code></td>
                                                <td><code>#f0f8ff</code></td>
                                                <td style="background: aliceblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #faebd7;">&nbsp;</td>
                                                <td style="text-align: center;"><code>antiquewhite</code></td>
                                                <td><code>#faebd7</code></td>
                                                <td style="background: antiquewhite;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #7fffd4;">&nbsp;</td>
                                                <td style="text-align: center;"><code>aquamarine</code></td>
                                                <td><code>#7fffd4</code></td>
                                                <td style="background: aquamarine;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f0ffff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>azure</code></td>
                                                <td><code>#f0ffff</code></td>
                                                <td style="background: azure;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f5f5dc;">&nbsp;</td>
                                                <td style="text-align: center;"><code>beige</code></td>
                                                <td><code>#f5f5dc</code></td>
                                                <td style="background: beige;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffe4c4;">&nbsp;</td>
                                                <td style="text-align: center;"><code>bisque</code></td>
                                                <td><code>#ffe4c4</code></td>
                                                <td style="background: bisque;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffebcd;">&nbsp;</td>
                                                <td style="text-align: center;"><code>blanchedalmond</code></td>
                                                <td><code>#ffebcd</code></td>
                                                <td style="background: blanchedalmond;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #8a2be2;">&nbsp;</td>
                                                <td style="text-align: center;"><code>blueviolet</code></td>
                                                <td><code>#8a2be2</code></td>
                                                <td style="background: blueviolet;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #a52a2a;">&nbsp;</td>
                                                <td style="text-align: center;"><code>brown</code></td>
                                                <td><code>#a52a2a</code></td>
                                                <td style="background: brown;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #deb887;">&nbsp;</td>
                                                <td style="text-align: center;"><code>burlywood</code></td>
                                                <td><code>#deb887</code></td>
                                                <td style="background: burlywood;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #5f9ea0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>cadetblue</code></td>
                                                <td><code>#5f9ea0</code></td>
                                                <td style="background: cadetblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #7fff00;">&nbsp;</td>
                                                <td style="text-align: center;"><code>chartreuse</code></td>
                                                <td><code>#7fff00</code></td>
                                                <td style="background: chartreuse;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #d2691e;">&nbsp;</td>
                                                <td style="text-align: center;"><code>chocolate</code></td>
                                                <td><code>#d2691e</code></td>
                                                <td style="background: chocolate;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ff7f50;">&nbsp;</td>
                                                <td style="text-align: center;"><code>coral</code></td>
                                                <td><code>#ff7f50</code></td>
                                                <td style="background: coral;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #6495ed;">&nbsp;</td>
                                                <td style="text-align: center;"><code>cornflowerblue</code></td>
                                                <td><code>#6495ed</code></td>
                                                <td style="background: cornflowerblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fff8dc;">&nbsp;</td>
                                                <td style="text-align: center;"><code>cornsilk</code></td>
                                                <td><code>#fff8dc</code></td>
                                                <td style="background: cornsilk;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #dc143c;">&nbsp;</td>
                                                <td style="text-align: center;"><code>crimson</code></td>
                                                <td><code>#dc143c</code></td>
                                                <td style="background: crimson;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #0ff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>cyan</code><br>
                                                    (synonym of <code>aqua</code>)</td>
                                                <td><code>#00ffff</code></td>
                                                <td style="background: cyan;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #00008b;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkblue</code></td>
                                                <td><code>#00008b</code></td>
                                                <td style="background: darkblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #008b8b;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkcyan</code></td>
                                                <td><code>#008b8b</code></td>
                                                <td style="background: darkcyan;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #b8860b;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkgoldenrod</code></td>
                                                <td><code>#b8860b</code></td>
                                                <td style="background: darkgoldenrod;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #a9a9a9;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkgray</code></td>
                                                <td><code>#a9a9a9</code></td>
                                                <td style="background: darkgray;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #006400;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkgreen</code></td>
                                                <td><code>#006400</code></td>
                                                <td style="background: darkgreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #a9a9a9;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkgrey</code></td>
                                                <td><code>#a9a9a9</code></td>
                                                <td style="background: darkgrey;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #bdb76b;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkkhaki</code></td>
                                                <td><code>#bdb76b</code></td>
                                                <td style="background: darkkhaki;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #8b008b;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkmagenta</code></td>
                                                <td><code>#8b008b</code></td>
                                                <td style="background: darkmagenta;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #556b2f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkolivegreen</code></td>
                                                <td><code>#556b2f</code></td>
                                                <td style="background: darkolivegreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ff8c00;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkorange</code></td>
                                                <td><code>#ff8c00</code></td>
                                                <td style="background: darkorange;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #9932cc;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkorchid</code></td>
                                                <td><code>#9932cc</code></td>
                                                <td style="background: darkorchid;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #8b0000;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkred</code></td>
                                                <td><code>#8b0000</code></td>
                                                <td style="background: darkred;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #e9967a;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darksalmon</code></td>
                                                <td><code>#e9967a</code></td>
                                                <td style="background: darksalmon;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #8fbc8f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkseagreen</code></td>
                                                <td><code>#8fbc8f</code></td>
                                                <td style="background: darkseagreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #483d8b;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkslateblue</code></td>
                                                <td><code>#483d8b</code></td>
                                                <td style="background: darkslateblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #2f4f4f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkslategray</code></td>
                                                <td><code>#2f4f4f</code></td>
                                                <td style="background: darkslategray;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #2f4f4f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkslategrey</code></td>
                                                <td><code>#2f4f4f</code></td>
                                                <td style="background: darkslategrey;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #00ced1;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkturquoise</code></td>
                                                <td><code>#00ced1</code></td>
                                                <td style="background: darkturquoise;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #9400d3;">&nbsp;</td>
                                                <td style="text-align: center;"><code>darkviolet</code></td>
                                                <td><code>#9400d3</code></td>
                                                <td style="background: darkviolet;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ff1493;">&nbsp;</td>
                                                <td style="text-align: center;"><code>deeppink</code></td>
                                                <td><code>#ff1493</code></td>
                                                <td style="background: deeppink;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #00bfff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>deepskyblue</code></td>
                                                <td><code>#00bfff</code></td>
                                                <td style="background: deepskyblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #696969;">&nbsp;</td>
                                                <td style="text-align: center;"><code>dimgray</code></td>
                                                <td><code>#696969</code></td>
                                                <td style="background: dimgray;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #696969;">&nbsp;</td>
                                                <td style="text-align: center;"><code>dimgrey</code></td>
                                                <td><code>#696969</code></td>
                                                <td style="background: dimgrey;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #1e90ff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>dodgerblue</code></td>
                                                <td><code>#1e90ff</code></td>
                                                <td style="background: dodgerblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #b22222;">&nbsp;</td>
                                                <td style="text-align: center;"><code>firebrick</code></td>
                                                <td><code>#b22222</code></td>
                                                <td style="background: firebrick;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fffaf0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>floralwhite</code></td>
                                                <td><code>#fffaf0</code></td>
                                                <td style="background: floralwhite;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #228b22;">&nbsp;</td>
                                                <td style="text-align: center;"><code>forestgreen</code></td>
                                                <td><code>#228b22</code></td>
                                                <td style="background: forestgreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #dcdcdc;">&nbsp;</td>
                                                <td style="text-align: center;"><code>gainsboro</code></td>
                                                <td><code>#dcdcdc</code></td>
                                                <td style="background: gainsboro;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f8f8ff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>ghostwhite</code></td>
                                                <td><code>#f8f8ff</code></td>
                                                <td style="background: ghostwhite;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffd700;">&nbsp;</td>
                                                <td style="text-align: center;"><code>gold</code></td>
                                                <td><code>#ffd700</code></td>
                                                <td style="background: gold;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #daa520;">&nbsp;</td>
                                                <td style="text-align: center;"><code>goldenrod</code></td>
                                                <td><code>#daa520</code></td>
                                                <td style="background: goldenrod;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #adff2f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>greenyellow</code></td>
                                                <td><code>#adff2f</code></td>
                                                <td style="background: greenyellow ;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #808080;">&nbsp;</td>
                                                <td style="text-align: center;"><code>grey</code></td>
                                                <td><code>#808080</code></td>
                                                <td style="background: grey;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f0fff0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>honeydew</code></td>
                                                <td><code>#f0fff0</code></td>
                                                <td style="background: honeydew;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ff69b4;">&nbsp;</td>
                                                <td style="text-align: center;"><code>hotpink</code></td>
                                                <td><code>#ff69b4</code></td>
                                                <td style="background: hotpink;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #cd5c5c;">&nbsp;</td>
                                                <td style="text-align: center;"><code>indianred</code></td>
                                                <td><code>#cd5c5c</code></td>
                                                <td style="background: indianred;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #4b0082;">&nbsp;</td>
                                                <td style="text-align: center;"><code>indigo</code></td>
                                                <td><code>#4b0082</code></td>
                                                <td style="background: indigo;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fffff0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>ivory</code></td>
                                                <td><code>#fffff0</code></td>
                                                <td style="background: ivory;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f0e68c;">&nbsp;</td>
                                                <td style="text-align: center;"><code>khaki</code></td>
                                                <td><code>#f0e68c</code></td>
                                                <td style="background: khaki;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #e6e6fa;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lavender</code></td>
                                                <td><code>#e6e6fa</code></td>
                                                <td style="background: lavender;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fff0f5;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lavenderblush</code></td>
                                                <td><code>#fff0f5</code></td>
                                                <td style="background: lavenderblush ;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #7cfc00;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lawngreen</code></td>
                                                <td><code>#7cfc00</code></td>
                                                <td style="background: lawngreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fffacd;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lemonchiffon</code></td>
                                                <td><code>#fffacd</code></td>
                                                <td style="background: lemonchiffon;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #add8e6;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightblue</code></td>
                                                <td><code>#add8e6</code></td>
                                                <td style="background: lightblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f08080;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightcoral</code></td>
                                                <td><code>#f08080</code></td>
                                                <td style="background: lightcoral;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #e0ffff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightcyan</code></td>
                                                <td><code>#e0ffff</code></td>
                                                <td style="background: lightcyan;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fafad2;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightgoldenrodyellow</code></td>
                                                <td><code>#fafad2</code></td>
                                                <td style="background: lightgoldenrodyellow ;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #d3d3d3;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightgray</code></td>
                                                <td><code>#d3d3d3</code></td>
                                                <td style="background: lightgray;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #90ee90;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightgreen</code></td>
                                                <td><code>#90ee90</code></td>
                                                <td style="background: lightgreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #d3d3d3;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightgrey</code></td>
                                                <td><code>#d3d3d3</code></td>
                                                <td style="background: lightgrey;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffb6c1;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightpink</code></td>
                                                <td><code>#ffb6c1</code></td>
                                                <td style="background: lightpink;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffa07a;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightsalmon</code></td>
                                                <td><code>#ffa07a</code></td>
                                                <td style="background: lightsalmon;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #20b2aa;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightseagreen</code></td>
                                                <td><code>#20b2aa</code></td>
                                                <td style="background: lightseagreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #87cefa;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightskyblue</code></td>
                                                <td><code>#87cefa</code></td>
                                                <td style="background: lightskyblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #778899;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightslategray</code></td>
                                                <td><code>#778899</code></td>
                                                <td style="background: lightslategray;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #778899;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightslategrey</code></td>
                                                <td><code>#778899</code></td>
                                                <td style="background: lightslategrey;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #b0c4de;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightsteelblue</code></td>
                                                <td><code>#b0c4de</code></td>
                                                <td style="background: lightsteelblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffffe0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>lightyellow</code></td>
                                                <td><code>#ffffe0</code></td>
                                                <td style="background: lightyellow;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #32cd32;">&nbsp;</td>
                                                <td style="text-align: center;"><code>limegreen</code></td>
                                                <td><code>#32cd32</code></td>
                                                <td style="background: limegreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #faf0e6;">&nbsp;</td>
                                                <td style="text-align: center;"><code>linen</code></td>
                                                <td><code>#faf0e6</code></td>
                                                <td style="background: linen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ff00ff;">&nbsp;</td>
                                                <td style="text-align: center;"><code>magenta</code><br>
                                                    (synonym of <code>fuchsia</code>)</td>
                                                <td><code>#ff00ff</code></td>
                                                <td style="background: magenta;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #66cdaa;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumaquamarine</code></td>
                                                <td><code>#66cdaa</code></td>
                                                <td style="background: mediumaquamarine;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #0000cd;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumblue</code></td>
                                                <td><code>#0000cd</code></td>
                                                <td style="background: mediumblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ba55d3;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumorchid</code></td>
                                                <td><code>#ba55d3</code></td>
                                                <td style="background: mediumorchid;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #9370db;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumpurple</code></td>
                                                <td><code>#9370db</code></td>
                                                <td style="background: mediumpurple;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #3cb371;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumseagreen</code></td>
                                                <td><code>#3cb371</code></td>
                                                <td style="background: mediumseagreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #7b68ee;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumslateblue</code></td>
                                                <td><code>#7b68ee</code></td>
                                                <td style="background: mediumslateblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #00fa9a;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumspringgreen</code></td>
                                                <td><code>#00fa9a</code></td>
                                                <td style="background: mediumspringgreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #48d1cc;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumturquoise</code></td>
                                                <td><code>#48d1cc</code></td>
                                                <td style="background: mediumturquoise;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #c71585;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mediumvioletred</code></td>
                                                <td><code>#c71585</code></td>
                                                <td style="background: mediumvioletred;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #191970;">&nbsp;</td>
                                                <td style="text-align: center;"><code>midnightblue</code></td>
                                                <td><code>#191970</code></td>
                                                <td style="background: midnightblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f5fffa;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mintcream</code></td>
                                                <td><code>#f5fffa</code></td>
                                                <td style="background: mintcream;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffe4e1;">&nbsp;</td>
                                                <td style="text-align: center;"><code>mistyrose</code></td>
                                                <td><code>#ffe4e1</code></td>
                                                <td style="background: mistyrose;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffe4b5;">&nbsp;</td>
                                                <td style="text-align: center;"><code>moccasin</code></td>
                                                <td><code>#ffe4b5</code></td>
                                                <td style="background: moccasin;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffdead;">&nbsp;</td>
                                                <td style="text-align: center;"><code>navajowhite</code></td>
                                                <td><code>#ffdead</code></td>
                                                <td style="background: navajowhite;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fdf5e6;">&nbsp;</td>
                                                <td style="text-align: center;"><code>oldlace</code></td>
                                                <td><code>#fdf5e6</code></td>
                                                <td style="background: oldlace;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #6b8e23;">&nbsp;</td>
                                                <td style="text-align: center;"><code>olivedrab</code></td>
                                                <td><code>#6b8e23</code></td>
                                                <td style="background: olivedrab;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ff4500;">&nbsp;</td>
                                                <td style="text-align: center;"><code>orangered</code></td>
                                                <td><code>#ff4500</code></td>
                                                <td style="background: orangered;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #da70d6;">&nbsp;</td>
                                                <td style="text-align: center;"><code>orchid</code></td>
                                                <td><code>#da70d6</code></td>
                                                <td style="background: orchid;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #eee8aa;">&nbsp;</td>
                                                <td style="text-align: center;"><code>palegoldenrod</code></td>
                                                <td><code>#eee8aa</code></td>
                                                <td style="background: palegoldenrod;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #98fb98;">&nbsp;</td>
                                                <td style="text-align: center;"><code>palegreen</code></td>
                                                <td><code>#98fb98</code></td>
                                                <td style="background: palegreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #afeeee;">&nbsp;</td>
                                                <td style="text-align: center;"><code>paleturquoise</code></td>
                                                <td><code>#afeeee</code></td>
                                                <td style="background: paleturquoise;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #db7093;">&nbsp;</td>
                                                <td style="text-align: center;"><code>palevioletred</code></td>
                                                <td><code>#db7093</code></td>
                                                <td style="background: palevioletred;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffefd5;">&nbsp;</td>
                                                <td style="text-align: center;"><code>papayawhip</code></td>
                                                <td><code>#ffefd5</code></td>
                                                <td style="background: papayawhip;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffdab9;">&nbsp;</td>
                                                <td style="text-align: center;"><code>peachpuff</code></td>
                                                <td><code>#ffdab9</code></td>
                                                <td style="background: peachpuff;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #cd853f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>peru</code></td>
                                                <td><code>#cd853f</code></td>
                                                <td style="background: peru;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ffc0cb;">&nbsp;</td>
                                                <td style="text-align: center;"><code>pink</code></td>
                                                <td><code>#ffc0cb</code></td>
                                                <td style="background: pink;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #dda0dd;">&nbsp;</td>
                                                <td style="text-align: center;"><code>plum</code></td>
                                                <td><code>#dda0dd</code></td>
                                                <td style="background: plum;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #b0e0e6;">&nbsp;</td>
                                                <td style="text-align: center;"><code>powderblue</code></td>
                                                <td><code>#b0e0e6</code></td>
                                                <td style="background: powderblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #bc8f8f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>rosybrown</code></td>
                                                <td><code>#bc8f8f</code></td>
                                                <td style="background: rosybrown;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #4169e1;">&nbsp;</td>
                                                <td style="text-align: center;"><code>royalblue</code></td>
                                                <td><code>#4169e1</code></td>
                                                <td style="background: royalblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #8b4513;">&nbsp;</td>
                                                <td style="text-align: center;"><code>saddlebrown</code></td>
                                                <td><code>#8b4513</code></td>
                                                <td style="background: saddlebrown;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fa8072;">&nbsp;</td>
                                                <td style="text-align: center;"><code>salmon</code></td>
                                                <td><code>#fa8072</code></td>
                                                <td style="background: salmon;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f4a460;">&nbsp;</td>
                                                <td style="text-align: center;"><code>sandybrown</code></td>
                                                <td><code>#f4a460</code></td>
                                                <td style="background: sandybrown;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #2e8b57;">&nbsp;</td>
                                                <td style="text-align: center;"><code>seagreen</code></td>
                                                <td><code>#2e8b57</code></td>
                                                <td style="background: seagreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fff5ee;">&nbsp;</td>
                                                <td style="text-align: center;"><code>seashell</code></td>
                                                <td><code>#fff5ee</code></td>
                                                <td style="background: seashell;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #a0522d;">&nbsp;</td>
                                                <td style="text-align: center;"><code>sienna</code></td>
                                                <td><code>#a0522d</code></td>
                                                <td style="background: sienna;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #87ceeb;">&nbsp;</td>
                                                <td style="text-align: center;"><code>skyblue</code></td>
                                                <td><code>#87ceeb</code></td>
                                                <td style="background: skyblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #6a5acd;">&nbsp;</td>
                                                <td style="text-align: center;"><code>slateblue</code></td>
                                                <td><code>#6a5acd</code></td>
                                                <td style="background: slateblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #708090;">&nbsp;</td>
                                                <td style="text-align: center;"><code>slategray</code></td>
                                                <td><code>#708090</code></td>
                                                <td style="background: slategray;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #708090;">&nbsp;</td>
                                                <td style="text-align: center;"><code>slategrey</code></td>
                                                <td><code>#708090</code></td>
                                                <td style="background: slategrey;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #fffafa;">&nbsp;</td>
                                                <td style="text-align: center;"><code>snow</code></td>
                                                <td><code>#fffafa</code></td>
                                                <td style="background: snow;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #00ff7f;">&nbsp;</td>
                                                <td style="text-align: center;"><code>springgreen</code></td>
                                                <td><code>#00ff7f</code></td>
                                                <td style="background: springgreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #4682b4;">&nbsp;</td>
                                                <td style="text-align: center;"><code>steelblue</code></td>
                                                <td><code>#4682b4</code></td>
                                                <td style="background: steelblue;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #d2b48c;">&nbsp;</td>
                                                <td style="text-align: center;"><code>tan</code></td>
                                                <td><code>#d2b48c</code></td>
                                                <td style="background: tan;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #d8bfd8;">&nbsp;</td>
                                                <td style="text-align: center;"><code>thistle</code></td>
                                                <td><code>#d8bfd8</code></td>
                                                <td style="background: thistle;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ff6347;">&nbsp;</td>
                                                <td style="text-align: center;"><code>tomato</code></td>
                                                <td><code>#ff6347</code></td>
                                                <td style="background: tomato;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #40e0d0;">&nbsp;</td>
                                                <td style="text-align: center;"><code>turquoise</code></td>
                                                <td><code>#40e0d0</code></td>
                                                <td style="background: turquoise;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #ee82ee;">&nbsp;</td>
                                                <td style="text-align: center;"><code>violet</code></td>
                                                <td><code>#ee82ee</code></td>
                                                <td style="background: violet;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f5deb3;">&nbsp;</td>
                                                <td style="text-align: center;"><code>wheat</code></td>
                                                <td><code>#f5deb3</code></td>
                                                <td style="background: wheat;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #f5f5f5;">&nbsp;</td>
                                                <td style="text-align: center;"><code>whitesmoke</code></td>
                                                <td><code>#f5f5f5</code></td>
                                                <td style="background: whitesmoke;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #9acd32;">&nbsp;</td>
                                                <td style="text-align: center;"><code>yellowgreen</code></td>
                                                <td><code>#9acd32</code></td>
                                                <td style="background: yellowgreen;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td><a href="https://drafts.csswg.org/css-color/" class="external external-icon" hreflang="en" title="The 'CSS Color Module Level&nbsp;4' specification" lang="en">CSS Color Module Level&nbsp;4</a></td>
                                                <td style="background: #639;">&nbsp;</td>
                                                <td style="text-align: center;"><a href="https://en.wikipedia.org/wiki/Eric_A._Meyer#Personal_life" class="external external-icon"><code>rebeccapurple</code></a></td>
                                                <td><code>#663399</code></td>
                                                <td style="background: rebeccapurple;">&nbsp;</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        </div>

                                </div>
                                <div id="background-sample" class="col-lg-2 ${backgroundSampleClass}" style="${backgroundSampleStyle}">
                                    <div id="background_ColorPicker" class="colorPickerContainer">
                                        <input id="background_imputColorPicker"
                                               tabindex="-1"
                                               aria-label="<fmt:message key="form.backgroundColor"/>"
                                               type="color"
                                               value="${backgroundHEX}">

                                        <!-- License CC-By 3.0
                                                Icon by Denis Klyuchnikov from the Noun Project
                                                https://thenounproject.com/denis.klyuchnikov.1/uploads/?i=542309
                                        -->
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                             aria-hidden="true"
                                             viewBox="0 0 24 30" width="18" >
                                              <path fill="rgb(0, 0, 0)" d="M1 20.303c0 1.467 1.125 2.667 2.5 2.667S6 21.77 6 20.303c0-1.467-2.5-5.333-2.5-5.333S1 18.836 1 20.303zm20.085-10.54l-5.877-5.878c-.392-.392-.86-.658-1.36-.798l.92-.92c.316-.315.315-.82.003-1.133-.31-.314-.82-.31-1.13.003L9.825 4.85c-.014.015-.028.03-.04.046l-4.87 4.866c-1.22 1.22-1.22 3.197 0 4.416l5.878 5.877c1.22 1.22 3.2 1.22 4.42 0l5.876-5.877c1.22-1.22 1.22-3.197 0-4.416zM5.6 12c0-.39.15-.78.447-1.077l5.876-5.876c.596-.596 1.558-.596 2.154 0l5.876 5.876c.298.298.447.687.447 1.077H5.6z"></path>
                                        </svg>
                                    </div>
                                    <span id="background-sample-invalid" style="${backgroundInvalidStyle}" class="invalid-color"><fmt:message key="form.invalidColor"/></span>
                                </div>
                            </div>



                            <%-- Ratio --%>
                            <c:set var="ratioOnError">
                                <form:errors path="ratio"/>
                            </c:set>
                            <c:choose>
                                <c:when test="${not empty ratioOnError}">
                                    <c:set var="ratioOnError" value="has-error"/>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                            <div class="form-group ${ratioOnError}">
                                <label for="ratio" class="col-lg-3 control-label"><fmt:message key="form.ratio"/></label>
                                <div class="col-lg-4">
                                    <form:select class="form-control" path="ratio">
                                        <form:option value="3"></form:option>
                                        <form:option value="4.5"></form:option>
                                        <form:option value="7"></form:option>
                                    </form:select>
                                    <form:errors path="ratio" cssClass="help-block"/>
                                </div>
                            </div>
                            <!-- /col-lg-4 -->


                            <%-- Component to modify --%>
                            <div class="form-group">
                                <label for='isBackgroundTested' class="col-lg-3 control-label"><fmt:message key="form.component"/></label>
                                <div class="col-lg-4">
                                    <form:select class="form-control" path="isBackgroundTested">
                                        <form:option value="false"><fmt:message key="form.componentForeground"/></form:option>
                                        <form:option value="true"><fmt:message key="form.componentBackground"/></form:option>
                                    </form:select>
                                </div>
                            </div>

                            <%-- Choose alorithm --%>
                            <c:set var="algoOnError">
                                <form:errors path="algo"/>
                            </c:set>
                            <c:choose>
                                <c:when test="${not empty algoOnError}">
                                    <c:set var="algoOnError" value="has-error"/>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                            <div class="form-group ${algoOnError}">
                                <label for="algo" class="col-lg-3 control-label"><fmt:message key="form.objectifs"/></label>
                                <div class="col-lg-4">
                                    <form:select class="form-control" path="algo">
                                        <form:option value="Rgb"><fmt:message key="form.algoRGB"/></form:option>
                                        <form:option value="HSV"><fmt:message key="form.algoHSV"/></form:option>
                                    </form:select>
                                    <form:errors path="algo" cssClass="help-block"/>
                                </div> <!-- /col-lg-4 -->
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-4">
                                    <fmt:message key="form.validate" var="validateButton"/>
                               <%-- <input id="submit-button" type="submit" class="btn btn-default btn-lg col-lg-offset-2 col-lg-6" value="${validateButton}"/> --%>
                                    <input id="submit-button" type="submit"
                                           class="btn btn-default btn-lg btn-outline-success"
                                           value="${validateButton}"/>
                                </div>
                            </div>
                        </form:form>
                    </div><!-- class="col-lg-12' -->
                </div><!-- class="row' -->



                <c:if test="${not empty colorResult}">
                    <c:choose>
                        <%-- ===== Contrast OK ========================================================================================= --%>
                        <%-- Good contrast: nothing to do --%>
                        <c:when test="${colorResult.combinaisonValid}">
                            <div class="row">
                                <div class="alert-message block-message">
                                    <div class="result col-lg-12">
                                        <h2><fmt:message key="form.validContrast"/>${colorResult.submittedCombinaisonColor.contrast}</h2>
                                        <p><fmt:message key="form.validContrastDesc"/></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="result col-lg-12">
                                    <img src="<c:url value="Images/good.jpg"/>" alt="Correct contrast"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12" id="image-reference">
                                    <a rel="nofollow" title="Creative Commons Attribution 3.0 License" href="https://creativecommons.org/licenses/by/3.0/">
                                        <img src="<c:url value="Images/creative_common_logo.png"/>" alt="License"> </a>
                                    <a rel="nofollow" title="Flickr: Galerie de Thomas Hawk" href="https://www.flickr.com/photos/thomashawk">Thomas Hawk</a>
                                </div>
                            </div>
                        </c:when>

                        <%-- ===== Contrast not OK ========================================================================================= --%>
                        <%-- Invalid contrast: present solutions --%>
                        <c:otherwise>
                            <div class="row">
                                <div class="result col-lg-12">
                                    <h2> <fmt:message key="form.contrastOld"/></h2>
                                </div>
                                <div id="old-contrast" class="result col-lg-12">
                                    <table id="initial-contrast" class="table">
                                        <caption class="sr-only"><fmt:message key="form.initialContrastCaption"/></caption>
                                        <tr>
                                            <th scope="col" class="col01"><fmt:message key="form.contrastSolutionForeground"/></th>
                                            <th scope="col" class="col02"><fmt:message key="form.contrastSolutionBackground"/></th>
                                            <th scope="col" class="col04"><fmt:message key="form.contrastSolutionSample"/></th>
                                            <th scope="col" class="col03"><fmt:message key="form.contrastSolutionRatio"/></th>
                                            <th scope="col" class="col05"><fmt:message key="form.contrastSolutionDistance"/></th>
                                        </tr>
                                        <tr>
                                            <td class="col01">
                                                <div class="cercle" style="background-color:${colorModel.foreground}"></div>
                                                <ul class="color-codes">
                                                    <li class="color-value-hsl">${foregroundHSLColor}</li>
                                                    <li class="color-value-rgb">${foregroundColor}</li>
                                                    <li class="color-value-hexa">${foregroundHEX}</li>
                                                </ul>
                                            </td>
                                            <td class="col02">
                                                <div class="cercle" style="background-color:${colorModel.background}"></div>
                                                <ul class="color-codes">
                                                    <li class="color-value-hsl">${backgroundHSLColor}</li>
                                                    <li class="color-value-rgb">${backgroundColor}</li>
                                                    <li class="color-value-hexa">${backgroundHEX}</li>
                                                </ul>
                                            </td>
                                            <td  class="text-sample" style="color:${colorModel.foreground};background-color:${colorModel.background}">
                                                <p style="font-size:20px;">
                                                    <fmt:message key="form.sampleTitle"/>
                                                    <span style="font-weight:bold;"><fmt:message key="form.sampleTitleBold"/></span>
                                                </p>
                                                <p>
                                                    <fmt:message key="form.sampleText"/>
                                                    <span style="font-weight:bold;"><fmt:message key="form.sampleTextBold"/></span>
                                                    <fmt:message key="form.sampleText2"/>
                                                </p>
                                            </td>
                                            <td class="col03">
                                                ${oldContrast}
                                            </td>
                                            <td class="col05">
                                                ${oldDistance}
                                            </td>
                                        </tr>
                                    </table>
                                </div><!-- /col-lg-12 -->
                                <div class ="col-lg-12">
                                    <c:choose>
                                        <c:when test="${colorResult.numberOfSuggestedColors == 0}">
                                            <div class="h2-on-empty-result">
                                            </c:when>
                                            <c:otherwise>
                                                <div>
                                                </c:otherwise>
                                            </c:choose>
                                            <h2> <fmt:message key="form.contrastNew"/> : <fmt:message key="form.resultNumber"><fmt:param value="${resultNumber}"/></fmt:message>
                                                <span id="tested-color">(<fmt:formatNumber value="${colorResult.numberOfTestedColors}"/> <fmt:message key="form.testedColors"/>)</span></h2>
                                        </div>
                                        <c:if test="${colorResult.numberOfSuggestedColors > 0}">
                                            <table id="contrast-solution" class="table tablesorter">
                                                <caption id="theCaption" class="sr-only"><fmt:message key="form.contrastSolutionCaption"/></caption>
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="col01"><fmt:message key="form.contrastSolutionForeground"/></th>
                                                        <th scope="col" class="col02"><fmt:message key="form.contrastSolutionBackground"/></th>
                                                        <th scope="col" class="col04"><fmt:message key="form.contrastSolutionSample"/></th>
                                                        <th scope="col" class="col03"><fmt:message key="form.contrastSolutionRatio"/></th>
                                                        <th scope="col" class="col05"><abbr title="<fmt:message key="form.contrastSolutionDistanceEx"/>">
                                                                <fmt:message key="form.contrastSolutionDistance"/></abbr></th>
                                                    </tr>
                                                </thead>
                                                <c:if test="${colorModel.isBackgroundTested}">
                                                    <c:forEach var="result" items="${colorResult.suggestedColors}">
                                                        <tr>
                                                            <td class="col01">
                                                                <div class="cercle" style="background-color:rgb(${result.comparisonColor.red}, ${result.comparisonColor.green}, ${result.comparisonColor.blue})"></div>
                                                                <ul class="color-codes">
                                                                    <li class="color-value-hsl">${result.hslColorComp}</li>
                                                                    <li class="color-value-rgb">rgb(${result.comparisonColor.red}, ${result.comparisonColor.green}, ${result.comparisonColor.blue})</li>
                                                                    <li class="color-value-hexa">${result.hexaColorComp}</li>
                                                                </ul>
                                                            </td>
                                                            <td class="col02">
                                                                <div class="cercle" style="background-color:rgb(${result.color.red}, ${result.color.green}, ${result.color.blue})"></div>
                                                                <ul class="color-codes">
                                                                    <li class="color-value-hsl">${result.hslColor}</li>
                                                                    <li class="color-value-rgb">rgb(${result.color.red}, ${result.color.green}, ${result.color.blue})</li>
                                                                    <li class="color-value-hexa">${result.hexaColor}</li>
                                                                </ul>
                                                            </td>
                                                            <td  class="text-sample" style="
                                                                 color:rgb(${result.comparisonColor.red}, ${result.comparisonColor.green}, ${result.comparisonColor.blue});
                                                                 background-color:rgb(${result.color.red}, ${result.color.green}, ${result.color.blue})">

                                                                <p style="font-size:20px;">
                                                                    <fmt:message key="form.sampleTitle"/>
                                                                    <span style="font-weight:bold;"><fmt:message key="form.sampleTitleBold"/></span>
                                                                </p>
                                                                <p>
                                                                    <fmt:message key="form.sampleText"/>
                                                                    <span style="font-weight:bold;"><fmt:message key="form.sampleTextBold"/></span>
                                                                    <fmt:message key="form.sampleText2"/>
                                                                </p> 
                                                            </td>
                                                            <td class="col03">
                                                                ${result.contrast}
                                                            </td>
                                                            <td class="col05">
                                                                ${result.distance}
                                                            </td>                                                    
                                                        </tr>
                                                    </c:forEach>    
                                                </c:if>
                                                <c:if test="${!colorModel.isBackgroundTested}">
                                                    <c:forEach var="result" items="${colorResult.suggestedColors}"> 
                                                        <tr>
                                                            <td class="col01">
                                                                <div class="cercle" style="background-color:rgb(${result.color.red}, ${result.color.green}, ${result.color.blue})"></div>
                                                                <ul class="color-codes">
                                                                    <li class="color-value-hsl">${result.hslColor}</li>
                                                                    <li class="color-value-rgb">rgb(${result.color.red}, ${result.color.green}, ${result.color.blue})</li>
                                                                    <li class="color-value-hexa">${result.hexaColor}</li>
                                                                </ul>
                                                            </td>
                                                            <td class="col02">
                                                                <div class="cercle" style="background-color:rgb(${result.comparisonColor.red}, ${result.comparisonColor.green}, ${result.comparisonColor.blue})"></div>
                                                                <ul class="color-codes">
                                                                    <li class="color-value-hsl">${result.hslColorComp}</li>
                                                                    <li class="color-value-rgb">rgb(${result.comparisonColor.red}, ${result.comparisonColor.green}, ${result.comparisonColor.blue})</li>
                                                                    <li class="color-value-hexa">${result.hexaColorComp}</li>
                                                                </ul>
                                                            </td>
                                                            <td  class="text-sample" style="
                                                                 color:rgb(${result.color.red}, ${result.color.green}, ${result.color.blue});
                                                                 background-color:rgb(${result.comparisonColor.red}, ${result.comparisonColor.green}, ${result.comparisonColor.blue})">
                                                                <p style="font-size:20px;">
                                                                    <fmt:message key="form.sampleTitle"/>
                                                                    <span style="font-weight:bold;"> <fmt:message key="form.sampleTitleBold"/> </span>
                                                                </p>
                                                                <p>
                                                                    <fmt:message key="form.sampleText"/>
                                                                    <span style="font-weight:bold;"> <fmt:message key="form.sampleTextBold"/> </span>
                                                                    <fmt:message key="form.sampleText2"/>
                                                                </p> 
                                                            </td>
                                                            <td class="col03">
                                                                ${result.contrast}
                                                            </td>
                                                            <td class="col05">
                                                                ${result.distance}
                                                            </td>      
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </table>
                                        </c:if>
                                        <div id="notSatisfied">
                                            <fmt:message key="form.notSatisfied" />
                                        </div>
                                        <c:if test="${colorResult.numberOfSuggestedColors > 0}">
                                            <c:set var="retryUrl">
                                                <c:url value="result.html?foreground=${colorModel.foreground}&amp;background=${colorModel.background}&amp;algo=${otherAlgo}&amp;ratio=${colorModel.ratio}&amp;isBackgroundTested=${colorModel.isBackgroundTested}"></c:url>
                                            </c:set>
                                            <div class="noResult">
                                                <c:if test="${algo == 'HSV'}">
                                                    <a href="${fn:replace(retryUrl, '#', '%23')}"><fmt:message key="form.tryRgb"/></a>
                                                </c:if>
                                                <c:if test="${algo == 'Rgb'}">
                                                    <a href="${fn:replace(retryUrl, '#', '%23')}"><fmt:message key="form.tryHsv"/></a>
                                                </c:if>
                                            </div>
                                        </c:if>
                                        <c:if test="${colorResult.numberOfSuggestedColors == 0}">
                                            <c:set var="retryUrl">
                                                <c:url value="result.html?foreground=${colorModel.foreground}&amp;background=${colorModel.background}&amp;algo=${algo}&amp;ratio=${colorModel.ratio}&amp;isBackgroundTested=${!colorModel.isBackgroundTested}"></c:url>
                                            </c:set>
                                            <div class="noResult">
                                                <fmt:message key="form.anyResult"/> <a href="${fn:replace(retryUrl, '#', '%23')}"><fmt:message key="form.changeComponent"/>
                                                    <c:if test="${colorModel.isBackgroundTested}"><strong><fmt:message key="form.oppositeComponentBackground"/></strong></a>.</c:if>
                                                <c:if test="${!colorModel.isBackgroundTested}"><strong><fmt:message key="form.oppositeComponentForeground"/></strong></a>.</c:if>
                                                </div>
                                        </c:if>
                                    </div><!-- /col-lg-12 -->
                                </div><!-- /row -->
                            </c:otherwise>
                        </c:choose>        
                    </c:if>

                <%-- ===== USER HELP ========================================================================================= --%>
                <div class="help"> <%-- only on HomePage --%>
                    <c:if test="${empty colorResult}">
                        <fmt:message key="home.noResultTxt"/>
                    </c:if>
                </div>
            </div>  <!-- class="container' -->


            <%-- ===== FOOTER ========================================================================================= --%>
            <%@include file='/WEB-INF/template/footer.jspf' %>

            <!-- Javascript - Webapp -->
            <script src="<c:url value="Js/_contrast-finder.all.min.js?v=${appVersion}"/>"></script>
               <!-- <script src="<c:url value="Js/10-jquery.min.js?v=${appVersion}"/>"></script>
                    <c:if test="${colorResult.numberOfSuggestedColors > 0}">
                        <script src="<c:url value="Js/20-jquery.tablesorter.min.js?v=${appVersion}"/>"></script>
                        <script src="<c:url value="Js/25-accessible-min.js?v=${appVersion}"/>"></script>
                    </c:if>
                    <script src="<c:url value="Js/30-bootstrap.min.js?v=${appVersion}"/>"></script>
                    <script src="<c:url value="Js/35-affix.js?v=${appVersion}"/>"></script>
                    <script src="<c:url value="Js/36-sample.color.js?v=${appVersion}"/>"></script>
               -->

            <!-- Javascript - Web analytics -->
            <c:set var="piwikSiteId"     value="${piwikKey}"/>
            <c:set var="piwikServerURL"  value="${piwikServer}"/>
            <c:if test="${not empty piwikSiteId and not empty piwikServerURL}">
                <!-- Piwik code-->
                <script type="text/javascript">
                    var _paq = _paq || [];
                    _paq.push(["setDomains", ["*.app.contrast-finder.org","*.app.contrast-finder.org"]]);
                    _paq.push(['trackPageView']);
                    _paq.push(['enableLinkTracking']);
                    function loadPiwikAfterOnload(){
                        var u='${piwikServerURL}';
                        _paq.push(['setTrackerUrl', u+'piwik.php']);
                        _paq.push(['setSiteId', '${piwikSiteId}']);
                        var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
                        g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
                    }
                    if (window.addEventListener){ window.addEventListener("load", loadPiwikAfterOnload, false); }
                    else if (window.attachEvent){ window.attachEvent("onload", loadPiwikAfterOnload);           }
                    else                        { window.onload = loadPiwikAfterOnload();                       }
                </script><noscript><img src="${piwikServerURL}piwik.php?idsite=${piwikSiteId}" style="border:0;" alt="" /></noscript>
                <!-- End Piwik code -->
            </c:if>
        </body>
    </html>
</compress:html>
