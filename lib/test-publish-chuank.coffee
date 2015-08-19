TestPublishChuankView = require './test-publish-chuank-view'
{CompositeDisposable} = require 'atom'

module.exports = TestPublishChuank =
  testPublishChuankView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @testPublishChuankView = new TestPublishChuankView(state.testPublishChuankViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @testPublishChuankView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'test-publish-chuank:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @testPublishChuankView.destroy()

  serialize: ->
    testPublishChuankViewState: @testPublishChuankView.serialize()

  toggle: ->
    console.log 'TestPublishChuank was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
