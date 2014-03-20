class SignatureView extends Backbone.View
  events: {
  'click a.description-link'       : 'switchToDescription'
  'click a.snippet-link'           : 'switchToSnippet'
  'click a.fields-link'            : 'switchToFields'
  'click a.hide-link'              : 'switchToHide'
  'mousedown .snippet'          : 'snippetToTextArea'
  }

  initialize: ->

  render: ->
    template = @template()
    $(@el).html(template(@model))

    @switchToHide()

    @isParam = @model.isParam

    if @isParam
      $('.notice', $(@el)).text('Click to set as parameter value')

    @

  template: ->
      Handlebars.templates.signature

  # handler for show signature
  switchToDescription: (e) ->
    e?.preventDefault()
    $(".snippet", $(@el)).hide()
    $(".fields", $(@el)).hide()
    $(".description", $(@el)).show()
    $(".hide", $(@el)).hide()
    $('.description-link', $(@el)).addClass('selected')
    $('.snippet-link', $(@el)).removeClass('selected')
    $('.fields-link', $(@el)).removeClass('selected')
    $('.hide-link', $(@el)).removeClass('selected')
    
  # handler for show sample
  switchToSnippet: (e) ->
    e?.preventDefault()
    $(".description", $(@el)).hide()
    $(".fields", $(@el)).hide()
    $(".snippet", $(@el)).show()
    $(".hide", $(@el)).hide()
    $('.snippet-link', $(@el)).addClass('selected')
    $('.description-link', $(@el)).removeClass('selected')
    $('.fields-link', $(@el)).removeClass('selected')
    $('.hide-link', $(@el)).removeClass('selected')

  # handler for show fields
  switchToFields: (e) ->
    e?.preventDefault()
    $(".snippet", $(@el)).hide()
    $(".description", $(@el)).hide()    
    $(".fields", $(@el)).show()
    $(".hide", $(@el)).hide()
    $('.fields-link', $(@el)).addClass('selected')
    $('.snippet-link', $(@el)).removeClass('selected')
    $('.description-link', $(@el)).removeClass('selected')      
    $('.hide-link', $(@el)).removeClass('selected')

  # handler for hide
  switchToHide: (e) ->
    e?.preventDefault()
    $(".snippet", $(@el)).hide()
    $(".description", $(@el)).hide()    
    $(".fields", $(@el)).hide()
    $(".hide", $(@el)).show()
    $('.fields-link', $(@el)).removeClass('selected')
    $('.snippet-link', $(@el)).removeClass('selected')
    $('.description-link', $(@el)).removeClass('selected')      
    $('.hide-link', $(@el)).addClass('selected')


  # handler for snippet to text area
  snippetToTextArea: (e) ->
    if @isParam
      e?.preventDefault()
      textArea = $('#' + @model.fieldid, $(@el.parentNode.parentNode.parentNode.parentNode))
      if $.trim(textArea.val()) == ''
        textArea.val(@model.sampleJSON)


    
