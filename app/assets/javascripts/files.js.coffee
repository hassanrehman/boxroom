jQuery ->
  $("#uploader").plupload
    # General settings
    runtimes: "html5,flash,silverlight,html4"
    url: $("#new_user_file").attr("action")
    
    # User can upload no more then 20 files in one go (sets multiple_queues to false)
    max_file_count: 50
    chunk_size: "1mb"
    
    # Resize images on clientside if we can
    resize:
      width: 200
      height: 200
      quality: 90
      crop: true # crop to exact dimensions

    multipart_params:
      _http_accept: "application/javascript"
      authenticity_token: $("#new_user_file input[name=authenticity_token]").val()

    filters:
      
      # Maximum file size
      max_file_size: "1000mb"

    
    # Specify what files to browse for
    #
    #      mime_types: [
    #        {title : "Image files", extensions : "jpg,gif,png"},
    #        {title : "Zip files", extensions : "zip"}
    #      ]
    
    # Rename files by clicking on their titles
    rename: true
    
    # Sort files
    sortable: true
    
    # Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
    dragdrop: true
    
    # Views to activate
    views:
      list: true
      thumbs: true # Show thumbs
      active: "thumbs"

    
    # Flash settings
    flash_swf_url: "../../js/Moxie.swf"
    
    # Silverlight settings
    silverlight_xap_url: "../../js/Moxie.xap"
    init:
      UploadComplete: (up, files) ->
        
        # Called when all files are either uploaded or failed
        alert "Upload Complete"
        window.location = $(".link-to-back").attr("href")
        return

