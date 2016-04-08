---
layout: [post, amp]
title: "Microsoft, broken by design"
date: 2009-07-05
type: post
status: published
tags: Life, Microsoft, W3C, XML
---


Sean was having some problems with the .Net xml parser, it seems to think that attribute order is significant when the W3C spec says otherwise. W3C Spec:

> [Definition: The beginning of every non-empty XML element is marked by a**start-tag**.]
>
> ##### Start-tag
>
> [40]
> `STag`
> ::=
> `'<'[Name](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-Name) ([S](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-S) [Attribute](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-Attribute))*[S](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-S)? '>'`
> [[WFC: Unique Att Spec]](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#uniqattspec)
>
> [41]
> `Attribute`
> ::=
> `[Name](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-Name) [Eq](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-Eq) [AttValue](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-AttValue)`
> [[VC: Attribute Value Type]](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#ValueType)
>
> [[WFC: No External Entity References]](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NoExternalRefs)
>
> [[WFC: No < in Attribute Values]](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#CleanAttrVals)
> The[Name](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-Name) in the start- and end-tags gives the element's**type**. [Definition: The[Name](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-Name)-[AttValue](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-AttValue) pairs are referred to as the**attribute specifications** of the element], [Definition: with the[Name](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-Name) in each pair referred to as the**attribute name** ] and [Definition: the content of the[AttValue](http://dotnet.org.za/controlpanel/blogs/posteditor.aspx?SelectedNavItem=NewPost#NT-AttValue) (the text between the`'` or`"` delimiters) as the**attribute value**.] Note that the order of attribute specifications in a start-tag or empty-element tag is not significant.

Microsoft's response to Sean's bug:

> Hi Sean, This is by design.XNodeEqualityComparer was not designed to stricly adhere to the xml spec.Most people expect attribute ordering to be significant and hence XNodeEqualityComparer was designed that way. thanks Nithya Sampathkumar Program Manager

Read the full post [here](http://dotnet.org.za/codingsanity/archive/2009/07/05/by-design-bugs.aspx).
