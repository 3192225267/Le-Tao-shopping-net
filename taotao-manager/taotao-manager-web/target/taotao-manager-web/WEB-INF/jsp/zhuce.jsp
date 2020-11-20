<%--
  Created by IntelliJ IDEA.
  User: 刘振河
  Date: 2020/1/9
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path=request.getContextPath();String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<base href="<%=basePath%>>">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>注册</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/gloab.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/register.js"></script>
</head>
<body class="bgf4">
<div class="login-box f-mt10 f-pb50">
    <div class="main bgf">
        <div class="reg-box-pan display-inline">
            <div class="step">
                <ul>

                    <li class="col-xs-4">

                        <p class="lbg-txt"></p>
                    </li>
                    <li class="col-xs-4 on">
                        <span class="num"><em class="f-r5"></em><i>淘</i></span>

                        <p class="lbg-txt">注册新账号</p>
                    </li>
                    <li class="col-xs-4">

                    </li>
                </ul>
            </div>
            <form method="post" action="zhuce">
            <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
                <div class="part1">
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" maxlength="20"  name="username" required id="username" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头" id="adminNo" />                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus"><span>3-20位，中文、字母、数字、下划线的组合，以中文或字母开头</span></label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>邮箱：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" class="txt03 f-r3 " required  name="email" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" id="emaill" />
                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus" id="exailtext">请输入您的邮箱</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>

                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
                        <div class="f-fl item-ifo">
                            <input type="password" id="password" required maxlength="20" required name="userpwd" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="password"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                            <label class="focus valid"></label>
                            <span class="clearfix"></span>
                            <label class="strength">
                                <span class="f-fl f-size12">安全程度：</span>
                                <b><i>弱</i><i>中</i><i>强</i></b>
                            </label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
                        <div class="f-fl item-ifo">
                            <input type="password" required maxlength="20" class="txt03 f-r3 required" name="userpwd2" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="rePassword"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">请再输入一遍上面的密码</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>

                    <%--验证码--%>
                    <%--<div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" maxlength="4" class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty" data-error="验证码不能为空" />
                            <span class="ie8 icon-close close hide"></span>
                            <label class="f-size12 c-999 f-fl f-pl10">
                                <img src="images/yzm.jpg" />
                            </label>
                            <label class="icon-sucessfill blank hide" style="left:380px"></label>
                            <label class="focusa">看不清？<a href="javascript:;" class="c-blue">换一张</a></label>
                            <label class="focus valid" style="left:370px"></label>
                        </div>
                    </div>--%>

                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <div class="f-fl item-ifo">
                            <input type="submit" value="注册" style="width: 100px" id="btn_part1">
                        </div>
                    </div>
                    <div class="item col-xs-12" style="height:auto">
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <p class="f-size14 required"  data-valid="isChecked" data-error="请先同意条款">
                            <input type="checkbox" checked /><a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a>
                        </p>
                        <label class="focus valid"></label>
                    </div>
                </div>




            </div>
            </form>
        </div>
    </div>
</div>
<div class="m-sPopBg" style="z-index:998;"></div>
<div class="m-sPopCon regcon">
    <div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
    <div class="apply_up_content">
    	<pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息<br>
            例如，您在注册乐淘帐户时所填写的昵称、手机号码。
            感谢您信任并使用乐淘的产品和服务，我们根据最新的法律法规、监管政策要求，更新了《乐淘隐私政策》，并增加了《儿童隐私保护声明》。

引言<br>
乐淘严格遵守法律法规，遵循以下隐私保护原则，为您提供更加安全、可靠的服务：<br>
1、安全可靠：<br>
我们竭尽全力通过合理有效的信息安全技术及管理流程，防止您的信息泄露、损毁、丢失。<br>
2、自主选择：<br>
我们为您提供便利的信息管理选项，以便您做出合适的选择，管理您的个人信息。<br>
3、保护通信秘密：<br>
我们严格遵照法律法规，保护您的通信秘密，为您提供安全的通信服务。<br>
4、合理必要：<br>
为了向您和其他用户提供更好的服务，我们仅收集必要的信息。<br>
5、清晰透明：<br>
我们努力使用简明易懂的表述，向您介绍隐私政策，以便您清晰地了解我们的信息处理方式。<br>
6、将隐私保护融入产品设计：<br>
我们在产品或服务开发的各个环节，综合法律、产品、设计等多方因素，融入隐私保护的理念。<br>
本《隐私政策》主要向您说明：<br>

我们收集哪些信息<br>

我们收集信息的用途<br>

您所享有的权利<br>
希望您仔细阅读《隐私政策》（以下简称“本政策”），详细了解我们对信息的收集、使用方式，以便您更好地了解我们的服务并作出适当的选择。<br>
若您使用乐淘服务，即表示您认同我们在本政策中所述内容。除另有约定外，本政策所用术语与《乐淘服务协议》中的术语具有相同的涵义。<br>
如您有问题，请联系我们。<br>
我们收集的信息<br>
我们根据合法、正当、必要的原则，仅收集实现产品功能所必要的信息。<br>
您在使用我们服务时主动提供的信息<br>
您在注册帐户时填写的信息<br>
例如，您在注册QQ、微信帐户时所填写的昵称、手机号码。<br>
您在使用服务时上传的信息<br>
例如，您在使用QQ、微信时，上传的头像、分享的照片。<br>
您通过我们的客服或参加我们举办的活动时所提交的信息<br>
例如，您参与我们线上活动时填写的调查问卷中可能包含您的姓名、电话、家庭地址等信息。<br>
我们的部分服务可能需要您提供特定的个人敏感信息来实现特定功能。若您选择不提供该类信息，则可能无法正常使用服务中的特定功能，但不影响您使用服务中的其他功能。若您主动提供您的个人敏感信息，即表示您同意我们按本政策所述目的和方式来处理您的个人敏感信息。
我们在您使用服务时获取的信息<br>
日志信息。当您使用我们的服务时，我们可能会自动收集相关信息并存储为服务日志信息。<br>
1)设备信息<br>
例如，设备型号、操作系统版本、唯一设备标识符、电池、信号强度等信息。<br>
2)软件信息<br>
例如，软件的版本号、浏览器类型。为确保操作环境的安全或提供服务所需，我们会收集有关您使用的移动应用和其他软件的信息。<br>
3)IP地址<br>
4)服务日志信息<br>
例如，您在使用我们服务时搜索、查看的信息、服务故障信息、引荐网址等信息。<br>
5)通讯日志信息<br>
例如，您在使用我们服务时曾经通讯的账户、通讯时间和时长。<br>
·位置信息<br>
当您使用与位置有关的服务时，我们可能会记录您设备所在的位置信息，以便为您提供相关服务。<br>
在您使用服务时，我们可能会通过IP地址 、GPS、WLAN（如 WiFi)或基站等途径获取您的地理位置信息；<br>
您或其他用户在使用服务时提供的信息中可能包含您所在地理位置信息，例如您提供的帐号信息中可能包含的您所在地区信息，您或其他人共享的照片包含的地理标记信息。<br>
·其他相关信息<br>
为了帮助您更好地使用我们的产品或服务，我们会收集相关信息。例如，我们收集的好友列表、群列表信息、声纹特征值信息。为确保您使用我们服务时能与您认识的人进行联系，如您选择开启导入通讯录功能，我们可能对您联系人的姓名和电话号码进行加密，并仅收集加密后的信息。
其他用户分享的信息中含有您的信息<br>
例如，其他用户发布的照片或分享的视频中可能包含您的信息。<br>
从第三方合作伙伴获取的信息<br>
我们可能会获得您在使用第三方合作伙伴服务时所产生或分享的信息。例如，您使用微信或QQ帐户登录第三方合作伙伴服务时，我们会获得您登录第三方合作伙伴服务的名称、登录时间，方便您进行授权管理。请您仔细阅读第三方合作伙伴服务的用户协议或隐私政策。<br>
我们如何使用收集的信息<br>
我们严格遵守法律法规的规定及与用户的约定，将收集的信息用于以下用途。若我们超出以下用途使用您的信息，我们将再次向您进行说明，并征得您的同意。<br>
向您提供服务<br>
满足您的个性化需求<br>
例如，语言设定、位置设定、个性化的帮助服务。<br>
产品开发和服务优化<br>
例如，当我们的系统发生故障时，我们会记录和分析系统故障时产生的信息，优化我们的服务。<br>
安全保障<br>
例如，我们会将您的信息用于身份验证、安全防范、反诈骗监测、存档备份、客户的安全服务等用途。例如，您下载或安装的安全软件会对恶意程序或病毒进行检测，或为您识别诈骗信息。<br>
向您推荐您可能感兴趣的广告、资讯等<br>
评估、改善我们的广告投放和其他促销及推广活动的效果<br>
管理软件<br>
例如，进行软件认证、软件升级等。<br>
邀请您参与有关我们服务的调查<br>
为了让您有更好的体验、改善我们的服务或经您同意的其他用途，在符合相关法律法规的前提下，我们可能将通过某些服务所收集的信息用于我们的其他服务。例如，将您在使用我们某项服务时的信息，用于另一项服务中向您展示个性化的内容或广告、用于用户研究分析与统计等服务。
为了确保服务的安全，帮助我们更好地了解我们应用程序的运行情况，我们可能记录相关信息，例如，您使用应用程序的频率、故障信息、总体使用情况、性能数据以及应用程序的来源。我们不会将我们存储在分析软件中的信息与您在应用程序中提供的个人身份信息相结合。
我们如何使用cookie及相关技术<br>
我们或我们的第三方合作伙伴，可能通过放置安全的Cookie及相关技术收集您的信息，目的是为您提供更个性化的用户体验和服务。我们会严格要求第三方合作伙伴遵守本政策的相关规定。<br>
您也可以通过浏览器设置管理Cookie。但请注意，如果停用Cookie，您可能无法享受最佳的服务体验，某些服务也可能无法正常使用。若您希望了解更多Cookie的安全性等信息，可参见《Cookie政策说明》。<br>
您分享的信息<br>
您可以通过我们的服务与您的好友、家人及其他用户分享您的相关信息。例如，您在微信朋友圈中公开分享的文字和照片。<br>
请注意，这其中可能包含您的个人身份信息、个人财产信息等敏感信息。请您谨慎考虑披露您的相关个人敏感信息。<br>
您可通过我们服务中的隐私设置来控制您分享信息的范围，也可通过服务中的设置或我们提供的指引删除您公开分享的信息。但请您注意，这些信息仍可能由其他用户或不受我们控制的非关联第三方独立地保存。<br>
您如何管理自己的信息<br>
您可以在使用我们服务的过程中，访问、修改和删除您提供的注册信息和其他个人信息，也可按照通知指引与我们联系。您访问、修改和删除个人信息的范围和方式将取决于您使用的具体服务。<br>
例如，若您在使用地理位置相关服务时，希望停止分享您的地理位置信息，您可通过手机定位关闭功能、软硬件服务商及通讯服务提供商的关闭方式停止分享，建议您仔细阅读相关指引。<br>
我们将按照本政策所述，仅为实现我们产品或服务的功能，收集、使用您的信息。<br>
如您发现我们违反法律、行政法规的规定或者双方的约定收集、使用您的个人信息，您可以要求我们删除。<br>
如您发现我们收集、存储的您的个人信息有错误的，您也可以要求我们更正。<br>
请通过本政策列明的联系方式与我们联系。<br>
在您访问、修改和删除相关信息时，我们可能会要求您进行身份验证，以保障帐号的安全。<br>
请您理解，由于技术所限、法律或监管要求，我们可能无法满足您的所有要求，我们会在合理的期限内答复您的请求。<br>
我们分享的信息<br>
我们遵照法律法规的规定，对信息的分享进行严格的限制，例如：<br>
经您事先同意，我们可能与第三方分享您的个人信息<br>
仅为实现外部处理的目的，我们可能会与第三方合作伙伴（第三方服务供应商、承包商、代理、广告合作伙伴、应用开发者等，例如，代表我们发出电子邮件或推送通知的通讯服务提供商、为我们提供位置服务的地图服务供应商）（他们可能并非位于您所在的法域）分享您的个人信息，让他们按照我们的说明、隐私政策以及其他相关的保密和安全措施来为我们处理上述信息，并用于以下用途：<br>

向您提供我们的服务；<br>

实现“我们如何使用收集的信息”部分所述目的；<br>

履行我们在《乐淘服务协议》或本政策中的义务和行使我们的权利；<br>

理解、维护和改善我们的服务。<br>
如我们与上述第三方分享您的信息，我们将会采用加密、匿名化处理等手段保障您的信息安全。<br>
随着我们业务的持续发展，当发生合并、收购、资产转让等交易导致向第三方分享您的个人信息时，我们将通过推送通知、公告等形式告知您相关情形，按照法律法规及不低于本政策所要求的标准继续保护或要求新的管理者继续保护您的个人信息。<br>
我们会将所收集到的信息用于大数据分析。<br>
例如，我们将收集到的信息用于分析形成不包含任何个人信息的城市热力图或行业洞察报告。<br>
我们可能对外公开并与我们的合作伙伴分享经统计加工后不含身份识别内容的信息，用于了解用户如何使用我们服务或让公众了解我们服务的总体使用趋势。<br>
我们可能基于以下目的披露您的个人信息<br>

遵守适用的法律法规等有关规定；<br>

遵守法院判决、裁定或其他法律程序的规定；<br>

遵守相关政府机关或其他法定授权组织的要求；<br>

我们有理由确信需要遵守法律法规等有关规定；<br>

为执行相关服务协议或本政策、维护社会公共利益，为保护我们的客户、我们或我们的关联公司、其他用户或雇员的人身财产安全或其他合法权益合理且必要的用途。<br>
我们可能向您发送的信息<br>

信息推送<br>
您在使用我们的服务时，我们可能向您发送电子邮件、短信、资讯或推送通知。<br>
您可以按照我们的相关提示，在设备上选择取消订阅。<br>

与服务有关的公告<br>
我们可能在必要时（例如，因系统维护而暂停某一项服务时）向您发出与服务有关的公告。<br>
您可能无法取消这些与服务有关、性质不属于广告的公告。<br>
存储信息的地点和期限<br>
存储信息的地点<br>
我们遵守法律法规的规定，将境内收集的用户个人信息存储于境内。<br>
存储信息的期限<br>
一般而言，我们仅为实现目的所必需的最短时间保留您的个人信息。但在下列情况下，我们有可能因需符合法律要求，更改个人信息的存储时间：<br>
为遵守适用的法律法规等有关规定；<br>
为遵守法院判决、裁定或其他法律程序的规定；<br>
为遵守相关政府机关或法定授权组织的要求；<br>
我们有理由确信需要遵守法律法规等有关规定；<br>
为执行相关服务协议或本政策、维护社会公共利益，为保护们的客户、我们或我们的关联公司、其他用户或雇员的人身财产安全或其他合法权益所合理必需的用途。<br>
当我们的产品或服务发生停止运营的情形时，我们将采取例如，推送通知、公告等形式通知您，并在合理的期限内删除或匿名化处理您的个人信息。<br>
信息安全<br>
</strong>
        </pre>

    </div>
    <center><a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a></center>
</div>
<script>
    $(function(){

        $("#btn_part1").click(function(){
            //第一页的确定按钮
            var emailReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            $("#emaill").blur(function () {
                if(!$(this).val()){
                    emails = false;
                    alert("邮箱不能为空")
                    return false;
                }else {
                    if(emailReg.test($(this).val())){
                        emails = true;
                        $(this).next().text("");
                        return false;
                    }else {
                        emails = false;
                        alert("*邮箱格式错误，请检查");
                        return false;
                    }
                }
            });


        });


    });
    function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
    function closeClause(){
        $(".m-sPopBg,.m-sPopCon").hide();
    }
</script>
</body>
</html>
