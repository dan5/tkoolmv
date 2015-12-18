###:
 * @plugindesc Unity Ads Plugin
 * @author Dan Yamamoto
 * @license MIT
 *
 * @param gameID
 * @desc Game ID
 * @default 42517
 *
 * @param videoAdPlacementId
 * @desc Video Ad Placement Id
 * @default defaultZone
 *
 * @param rewardedVideoAdPlacementId
 * @desc Rewarded Video Ad Placement Id
 * @default rewardedVideoZone
 *
 * @param isTest
 * @desc Ipunt 'true' or 'false'
 * @default true
 *
####

parameters = PluginManager.parameters('UnityAdsMV')
gameId = String(parameters['gameId'] || '42517')
videoAdPlacementId = String(parameters['videoAdPlacementId'] || 'defaultZone')
rewardedVideoAdPlacementId = String(parameters['rewardedVideoAdPlacementId'] || 'rewardedVideoZone')
isTest = !parameters['isTest'].match(/^\s*(0|off|false)?\s*$/i)

unless window.unityads?
  window.unityads =
    showVideoAd: ->
    showRewardedVideoAd: ->
    loadedVideoAd: -> false
    loadedRewardedVideoAd: -> false
    isShowingVideoAd: -> false
    isShowingRewardedVideoAd: -> false

class CordovaUnityAdsMV
  constructor: ->
    @status = null
    @has_reward = false

  showVideoAd: ->
    if @loadedVideoAd()
      window.unityads.showVideoAd()
      @status = 'isReady'
    else
      console.log 'not loadedVideoAd'

  showRewardedVideoAd: ->

unless window.unityads?
  window.unityads =
    showVideoAd: ->
    showRewardedVideoAd: ->
    loadedVideoAd: -> false
    loadedRewardedVideoAd: -> false
    isShowingVideoAd: -> false
    isShowingRewardedVideoAd: -> false

class CordovaUnityAdsMV
  constructor: ->
    @status = null
    @has_reward = false

  showVideoAd: ->
    if @loadedVideoAd()
      window.unityads.showVideoAd()
      @status = 'isReady'
    else
      console.log 'not loadedVideoAd'

  showRewardedVideoAd: ->
    if @loadedRewardedVideoAd()
      window.unityads.showRewardedVideoAd()
      @status = 'isReady'
    else
      console.log 'not loadedRewardedVideoAd'

  loadedVideoAd: -> window.unityads.loadedVideoAd()
  loadedRewardedVideoAd: -> window.unityads.loadedRewardedVideoAd()
  isShowingVideoAd: -> window.unityads.isShowingVideoAd()
  isShowingRewardedVideoAd: -> window.unityads.isShowingRewardedVideoAd()

  isShowing: -> @status != null
  hasReward: -> @has_reward
  clearReward: -> @has_reward = false

window.UnityAdsMV = new CordovaUnityAdsMV()

setup = ->
  window.unityads.setUp gameId, videoAdPlacementId, rewardedVideoAdPlacementId, isTest
  window.unityads.onVideoAdLoaded = ->
    isTest and console.log 'onVideoAdLoaded'
  window.unityads.onVideoAdShown = ->
    isTest and console.log 'onVideoAdShown'
    window.UnityAdsMV.status = 'isShowing'
  window.unityads.onVideoAdHidden = ->
    isTest and console.log 'onVideoAdHidden'
    window.UnityAdsMV.status = null
  window.unityads.onRewardedVideoAdLoaded = ->
    isTest and console.log 'onRewardedVideoAdLoaded'
  window.unityads.onRewardedVideoAdShown = ->
    isTest and console.log 'onRewardedVideoAdShown'
    window.UnityAdsMV.status = 'isShowing'
  window.unityads.onRewardedVideoAdHidden = ->
    isTest and console.log 'onRewardedVideoAdHidden'
    window.UnityAdsMV.status = null
  window.unityads.onRewardedVideoAdCompleted = ->
    isTest and console.log 'onRewardedVideoAdCompleted'
    @has_reward = true

document.addEventListener "deviceready", setup, false
