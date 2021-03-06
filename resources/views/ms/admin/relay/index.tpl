{extends file='admin/base.tpl'}{block name='main'}
    <main class="content">
        <div class="content-header ui-content-header">
            <div class="container">
                <h1 class="content-heading">中转规则管理</h1>
            </div>
        </div>
        <div class="container">
            <div class="col-lg-12 col-md-12">
                <section class="content-inner margin-top-no">

                    <div class="card">
                        <div class="card-main">
                            <div class="card-inner">
                                <p>系统中所有的中转规则。</p>
                                <p>显示表项:
                                    {include file='table/checkbox.tpl'}
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-main">
                            <div class="card-inner">
                                <div class="form-group form-group-label">
                                    <label class="floating-label" for="search"> 输入用户 ID 进行搜索链路搜索 </label>
                                    <input class="form-control" id="search" type="text">
                                </div>
                            </div>
                            <div class="card-action">
                                <div class="card-action-btn pull-left">
                                    <a class="btn btn-flat waves-attach waves-light" id="search_button"><span
                                                class="icon">search</span>&nbsp;搜索</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        {include file='table/table.tpl'}
                    </div>

                    <div class="fbtn-container">
                        <div class="fbtn-inner">
                            <a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light"
                               href="/admin/relay/create">+</a>

                        </div>
                    </div>

                    <div aria-hidden="true" class="modal modal-va-middle fade" id="delete_modal" role="dialog"
                         tabindex="-1">
                        <div class="modal-dialog modal-xs">
                            <div class="modal-content">
                                <div class="modal-heading">
                                    <a class="modal-close" data-dismiss="modal">×</a>
                                    <h2 class="modal-title">确认要删除？</h2>
                                </div>
                                <div class="modal-inner">
                                    <p>请您确认。</p>
                                </div>
                                <div class="modal-footer">
                                    <p class="text-right">
                                        <button class="btn btn-flat btn-brand-accent waves-attach waves-effect"
                                                data-dismiss="modal" type="button">取消
                                        </button>
                                        <button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal"
                                                id="delete_input" type="button">确定
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    {include file='dialog.tpl'}


            </div>


        </div>
    </main>
{/block}{block name='script'}
    <script>
        function delete_modal_show(id) {
            deleteid = id;
            $("#delete_modal").modal();
        }

        {include file='table/js_1.tpl'}

        $(document).ready(function () {

            {include file='table/js_2.tpl'}

            function delete_id() {
                $.ajax({
                    type: "DELETE",
                    url: "/admin/relay",
                    dataType: "json",
                    data: {
                        id: deleteid
                    },
                    success: function (data) {
                        if (data.ret) {
                            $("#result").modal();
                            $("#msg").html(data.msg);
                            {include file='table/js_delete.tpl'}
                        } else {
                            $("#result").modal();
                            $("#msg").html(data.msg);
                        }
                    },
                    error: function (jqXHR) {
                        $("#result").modal();
                        $("#msg").html(data.msg + "  发生错误了。");
                    }
                });
            }

            $("#delete_input").click(function () {
                delete_id();
            });

            function search() {
                window.location = "/admin/relay/path_search/" + $("#search").val();
            }

            $("#search_button").click(function () {
                if ($("#search").val() != "") {
                    search();
                }
            });
        })

    </script>
{/block}
