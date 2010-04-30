def setup_iphone_request
  request.env["HTTP_USER_AGENT"] = "somethign iPhone something_else"
end

def setup_mobile_safari_request
  request.env["HTTP_USER_AGENT"] = "Mobile\/irrelevant Safari"
end