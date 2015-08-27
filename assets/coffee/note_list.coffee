# note_list.coffee
#
# Description:
#   manage NoteListItemView
#
# Author:
#   sota1235

App.NoteListView = Backbone.View.extend

  tagName: 'table'

  # assign 'table' class to attach bootstrap stylesheet
  className: 'table'

  initialize: (options) ->
    # receive Backbone.Collectin instance
    @collection = options.collection
    # call render() by collection's reset event
    @listenTo @collection, 'reset', @render

  render: () ->
    # build own DOMs by tmpelate
    template = $('#noteListView-template').html()
    this.$el.html template

    # render child view's from own collection
    this.renderItemViews()
    return this

  renderItemViews: () ->
    # specify point of appending child view
    $insertionPoint = this.$ '.js-noteListItemView-container'

    # take all models in collection and
    # render each view, then insert it into parent DOM tree
    this.collection.each (note) ->
      itemView = new App.NoteListItemView
        model: note
      $insertionPoint.append itemView.render().$el
    , this
