<#assign cartQuantity = 0 >
<#if productsInCart?? &amp;&amp; productsInCart.orderItemList??>
    <#list productsInCart.orderItemList as orderItem>
        <#assign cartQuantity = cartQuantity + orderItem.quantity>
    </#list>
</#if>
        <#include "../cart/sidebar.ftl"/>

        <#assign blogResp = ec.service.sync().name("org.moqui.impl.WikiServices.get#WikiPageChildren")
        .parameter("wikiSpaceId", wikiSpaceId).parameter("pagePath", "blog").call()>

        <div class="navbar-area">
            <div class="comero-nav">
                <div class="container">
                    <nav class="navbar navbar-expand-md navbar-light">
                        <a class="navbar-brand" href="/store/">
                            <img src="/zstatic/img/logo.svg" alt="logo" width="167" height="32">
                        </a>

                        <b-collapse class="collapse navbar-collapse" id="navbarSupportedContent" is-nav>
                            <ul class="navbar-nav">
                                
                                <li class="nav-item p-relative"><a href="/store/" class="nav-link">Home </a></li>
                                <li class="nav-item p-relative"><a href="/store/category/all" class="nav-link">Shop <i class="fas fa-chevron-down"></i></a>
                                    <ul class="dropdown-menu">
                                        <#list browseRootCategoryInfo.subCategoryList as category>
                                            <li class="nav-item"><a href="/store/category/${category.pseudoId}" class="nav-link">${category.categoryName}</a></li>
                                        </#list>
                                    </ul>
                                </li>

                                <li class="nav-item"><a href="/store/content/gallery" class="nav-link">Gallery</a></li>

                                <#if blogResp?? &amp;&amp; blogResp.childPageInfoList??>
                                <li class="nav-item p-relative"><a href="/store/content/blog" class="nav-link">Blog <i class="fas fa-chevron-down"></i></a>
    
                                    <ul class="dropdown-menu">
                                        <#list blogResp.childPageInfoList as childPage>
                                        <li class="nav-item"><a href="/store/content/${childPage.pagePath}" class="nav-link">${childPage.pageName}</a></li>
                                        </#list>
                                    </ul>
                                </li>
                                </#if>

                                <li class="nav-item">
                                    <a href="/store/content/contact" class="nav-link">Contact</a>
                                </li>
                            </ul>

                            <div class="others-option">
                                <#if partyDetail??>
                                <div class="option-item">
                                    <a href="/store/d#/account">${partyDetail.firstName!''} ${partyDetail.lastName!''}</a>
                                </div>
                                <#else>
                                <div class="option-item">
                                    <a href="/store/d#/login">Login</a>
                                </div>
                                </#if>
                                <div class="option-item">
                                    <a href="#" data-toggle="modal" data-target="#shoppingCartModal">
                                        Cart(${cartQuantity}) <i class="fas fa-shopping-bag"></i>
                                    </a>
                                </div>

                                <div class="toast" role="alert" aria-live="assertive" data-delay="4000" aria-atomic="true">
                                  <div class="toast-header">
                                    <strong class="mr-auto">Warning</strong>
                                    <small>0 mins ago</small>
                                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="toast-body">
                                    Hello, world! This is a toast message.
                                  </div>
                                </div>
                            </div>


                        </b-collapse>
                    </nav>
                </div>
            </div>
        </div>
        

        <script>
        $(function() {
            const navTop = $('.navbar-area').offset().top;
            $(window).scroll(function() {
                if ($(this).scrollTop() > navTop){  
                    $('.navbar-area').addClass("is-sticky");
                } else {
                    $('.navbar-area').removeClass("is-sticky");
                }
            });
        });
        </script>