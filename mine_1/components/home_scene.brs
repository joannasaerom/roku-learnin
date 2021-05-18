function init()
	? "[home_scene] init"
	m.category_screen = m.top.findNode("category_screen")
	m.content_screen = m.top.findNode("content_screen")

	m.category_screen.observeField("category_selected", "onCategorySelected")
	m.category_screen.setFocus(true)
end function

' Main Remote keypress handler
function onKeyEvent(key, press) as Boolean
	? "[home_scene] onKeyEvent", key, press
  return false
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: ";obj.getField()
    ? "onCategorySelected data: ";obj.getData()
    list = m.category_screen.findNode("category_list")
    ? "onCategorySelected checkedItem: ";list.checkedItem
    ? "onCategorySelected selected ContentNode: ";list.content.getChild(obj.getData())
    item = list.content.getChild(obj.getData())
    loadFeed(item.feed_url)
end sub

sub loadFeed(url)
  m.feed_task = createObject("roSGNode", "load_feed_task")
  m.feed_task.observeField("response", "onFeedResponse")
  m.feed_task.url = url
  m.feed_task.control = "RUN"
end sub

sub onFeedResponse(obj)
	response = obj.getData()
	data = parseJSON(response)
	if data <> Invalid and data.items <> invalid
        m.category_screen.visible = false
        m.content_screen.visible = true
		m.content_screen.feed_data = data
	else
		? "FEED RESPONSE IS EMPTY!"
	end if
end sub
