CKEDITOR.editorConfig = function (config) {
  config.toolbar = [
    {name: "basicstyles", items : ["Bold", "Italic", "Underline", "Strike"]},
    {name: "colors", items : ["RemoveFormat", "TextColor", "BGColor"]},
    {name: "paragraph", items : ["JustifyLeft", "JustifyCenter", "JustifyRight",
      "JustifyBlock", "-", "NumberedList", "BulletedList", "Outdent", "Indent"]},
    {name: "insert", items : ["Image", "Table", "Link"]},
    {name: "styles", items : ["Styles", "Format", "Font", "FontSize"]},
    {name: "editing", items : ["Find", "Replace", "SpellChecker", "Scayt", "Undo", "Redo"]}
 ];
  config.height = 350;
  config.extraPlugins = "lineutils";
  config.font = "Times New Roman"
}
