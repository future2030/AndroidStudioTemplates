<?xml version="1.0"?>
<recipe>
    <instantiate from="src/app_package/ClientLoginFragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}Fragment.kt" />

    <instantiate from="src/app_package/ClientLoginModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}Module.kt" />

    <instantiate from="src/app_package/ClientLoginUiData.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}UiData.kt" />

    <instantiate from="src/app_package/ClientLoginViewModel.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}ViewModel.kt" />

    <instantiate from="res/layout/fragment_home.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/fragment_${camelCaseToUnderscore(featurePackPrefix)}.xml" />

    
    
    <open file="${escapeXmlAttribute(resOut)}/layout/fragment_${camelCaseToUnderscore(featurePackPrefix)}.xml" />
    <open file="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}Fragment.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}Module.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}UiData.kt" />
     <open file="${escapeXmlAttribute(srcOut)}/${featurePackPrefix}ViewModel.kt" />

</recipe>