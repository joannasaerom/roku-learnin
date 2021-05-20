function init()
    m.category_list=m.top.findNode("category_list")
    m.category_list.setFocus(true)
    m.top.observeField("visible", "onVisibleChange")
end function

sub onVisibleChange()
	if m.top.visible = true then
		m.category_list.setFocus(true)
	end if
end sub

sub onCategorySelected(obj)
    ? "onCategorySelected field: ";obj.getField()
    ? "onCategorySelected data: ";obj.getData()
    ? "onCategorySelected checkedItem: ";m.category_list.checkedItem
    ? "onCategorySelected selected ContentNode: ";m.category_list.content.getChild(obj.getData())
    item = m.category_list.content.getChild(obj.getData())
    loadFeed(item.feed_url)
end sub

sub loadFeed(url)
  ? "loadFeed! ";url
end sub
