<#import "parts/common.ftl" as c>


<@c.page>

    <h5>${username}</h5>

    ${message?if_exists}
    <form method="post" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">


    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password: </label>
        <div class="col-sm-10">
            <input class="form-control" type="password" name="password" placeholder="user password"/>
        </div>

    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Email: </label>
        <div class="col-sm-10">
            <input class="form-control" type="email" name="email" placeholder="user@email" value="${email!''}"/>
        </div>

    </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}"/>


    <button class="btn btn-primary" type="submit">

        Save
    </button>
    </form>
</@c.page>
