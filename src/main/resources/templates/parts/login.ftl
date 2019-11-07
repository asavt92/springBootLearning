<#macro login path isRegisterForm>
    <form action="${path}" method="post" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">


        <div class="form-group row">

            <label class="col-sm-2 col-form-label"> User Name :</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" name="username" placeholder="username"/>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-10">
                <input class="form-control" type="password" name="password" placeholder="user password"/>
            </div>

        </div>

        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Email: </label>
                <div class="col-sm-10">
                    <input class="form-control" type="email" name="email" placeholder="user@email"/>
                </div>

            </div>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <#if !isRegisterForm>
            <a href="/registration">Add new user</a>
        </#if>

        <button class="btn btn-primary" type="submit">

            <#if isRegisterForm>
                Create
            <#else>
                Sign In
            </#if>
        </button>
    </form>

</#macro>


<#macro logout>

    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit"> Sign Out</button>
    </form>
</#macro>