###:
 * @plugindesc Unity Ads Plugin
 * @author Dan Yamamoto
 *
 * @param gameID
 * @desc
 * @default '42517'
 *
 * @param isTest
 * @desc
 * @default true
 *
 * @help
 *
 * Plugin Command:
 *   UnityAdsMV showRewardedVideoAd  #
 *   isShowing                       #
####

gameId = '42517'
videoAdPlacementId = 'defaultZone'
rewardedVideoAdPlacementId = 'rewardedVideoZone'
isTest = true

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
    if isTest
      console.log 'onVideoAdLoaded'
  window.unityads.onVideoAdShown = ->
    if isTest
      console.log 'onVideoAdShown'
    window.UnityAdsMV.status = 'isShowing'
  window.unityads.onVideoAdHidden = ->
    if isTest
      console.log 'onVideoAdHidden'
    window.UnityAdsMV.status = null
  window.unityads.onRewardedVideoAdLoaded = ->
    if isTest
      console.log 'onRewardedVideoAdLoaded'
  window.unityads.onRewardedVideoAdShown = ->
    if isTest
      console.log 'onRewardedVideoAdShown'
    window.UnityAdsMV.status = 'isShowing'
  window.unityads.onRewardedVideoAdHidden = ->
    if isTest
      console.log 'onRewardedVideoAdHidden'
    window.UnityAdsMV.status = null
  window.unityads.onRewardedVideoAdCompleted = ->
    if isTest
      console.log 'onRewardedVideoAdCompleted'
    @has_reward = true

document.addEventListener "deviceready", setup, false
