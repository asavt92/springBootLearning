<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>


<@c.page>
    ${message?if_exists}

    Login page
<@l.login "/login" false/>
</@c.page>
