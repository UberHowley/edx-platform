class CMS.Views.ModuleEdit extends Backbone.View
  tagName: 'section'
  className: 'edit-pane'

  events:
    'click .cancel': 'cancel'
    'click .module-edit': 'editSubmodule'
    'click .save-update': 'save'

  initialize: ->
    @$el.load @model.editUrl(), =>
      @model.loadModule(@el)

  save: (event) ->
    event.preventDefault()
    @model.save().success ->
      console.log "Saved"

  cancel: ->
    CMS.popView()

  editSubmodule: (event) ->
    event.preventDefault()
    CMS.pushView(new CMS.Views.ModuleEdit(model: new CMS.Models.Module(id: $(event.target).data('id'), type: $(event.target).data('type'))))
