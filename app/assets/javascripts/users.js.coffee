$(document).ready ->
  $('[data-behaviour~=datepicker]').datepicker {
    format: 'yyyy-mm-dd'
    language: 'zh-CN'
    autoclose: true
  }
