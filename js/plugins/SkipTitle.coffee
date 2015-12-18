###:
 * @plugindesc Skip Title Plugin
 * @author Dan Yamamoto
 * @license MIT
 *
####

load_game = ->
  if DataManager.isAnySavefileExists()
    DataManager.loadGame(1)
  else
    DataManager.setupNewGame()

Scene_Title::create = ->
  Scene_Base::create.call this

Scene_Title::start = ->
  Scene_Base::start.call this
  load_game()
  SceneManager.clearStack()
  SceneManager.goto Scene_Map

Scene_Title::update = ->
  Scene_Base::update.call this

Scene_Title::isBusy = ->
  Scene_Base::isBusy.call(this)
