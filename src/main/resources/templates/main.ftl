<#import "parts/common.ftl" as c>


<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" class="form-control" name="filter" value="${filter?if_exists}">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseSendMessageForm" role="button"
       aria-expanded="false"
       aria-controls="collapseExample">
        Add new message
    </a>

    <div class="collapse <#if message??>show</#if> " id="collapseSendMessageForm">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input class="form-control ${(textError??)?string('is-invalid','')} " value="<#if message??>${message.text}</#if> " type="text" name="text" placeholder="Введите сообщение"/>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>

                    </#if>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="tag" placeholder="Тэг"  value="<#if message??>${message.tag}</#if>">
                </div>
                <div class="form-group">

                    <div class="custom-file">
                        <input class="form-control" type="file" name="file" id="file">
                        <label class="custom-file-label" for="file">Choose File</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary " type="submit">Добавить</button>
            </form>
        </div>
    </div>
    <div>Список сообщений</div>

<div class="card-columns">
    <#list messages as message>
        <div>
            <#if message.filename??>
                <div class="card my-3" style="width: 18rem;">
                    <img class="card-img-top" src="/img/${message.filename}" alt="Card image cap">
                </div>
            </#if>
            <div class="m-2">
                <b>${message.id}</b>
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>

            <div>


            </div>
        </div>
    <#else >
        No messages
    </#list>
</div>
</@c.page>






