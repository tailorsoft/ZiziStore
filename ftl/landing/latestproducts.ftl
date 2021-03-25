<#include "../product/listing.ftl"/>

<#if storeInfo.categoryByType.PsctNewProducts?has_content>
    <#assign category = storeInfo.categoryByType.PsctNewProducts >
    <#assign products = ec.service.sync().name("popstore.ProductServices.get#CategoryProducts")
        .parameter("productStoreId", productStore.productStoreId).parameter("productCategoryId", category.productCategoryId)
        .parameter("pageSize", 8).call()>
    <div>
        <!-- Start All Products Area -->
        <section class="all-products-area pb-60">
            <div class="container">
                <div class="section-title">
                    <h2><span class="dot"></span> ${category.categoryName}</h2>
                </div>
                <div class="row">
                    <#list products.productList as product>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <#assign categoryId = browseRootCategory.pseudoId />
                            <#assign imageInfo = product.imageInfo!{}/>
                            <#assign imageContentId = imageInfo.productContentId!"-"/>
                            <#assign listPrice = product.listPrice!0/>
                            <#assign price = product.price!0/>
                            <@productlisting categoryId product.pseudoId product.productName imageContentId price listPrice  />
                        </div>
                    </#list>
                </div>
            </div>
        </section>
        <!-- End all Products Area -->
        <QuckView />
    </div>
</#if>