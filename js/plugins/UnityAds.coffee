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

class CordovaUnityAds
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

window.unityAds = new CordovaUnityAds()

setup = ->
  window.unityads.setUp gameId, videoAdPlacementId, rewardedVideoAdPlacementId, isTest
  window.unityads.onVideoAdLoaded = ->
    if isTest
      console.log 'onVideoAdLoaded'
  window.unityads.onVideoAdShown = ->
    if isTest
      console.log 'onVideoAdShown'
    window.unityAds.status = 'isShowing'
  window.unityads.onVideoAdHidden = ->
    if isTest
      console.log 'onVideoAdHidden'
    window.unityAds.status = null
  window.unityads.onRewardedVideoAdLoaded = ->
    if isTest
      console.log 'onRewardedVideoAdLoaded'
  window.unityads.onRewardedVideoAdShown = ->
    if isTest
      console.log 'onRewardedVideoAdShown'
    window.unityAds.status = 'isShowing'
  window.unityads.onRewardedVideoAdHidden = ->
    if isTest
      console.log 'onRewardedVideoAdHidden'
    window.unityAds.status = null
  window.unityads.onRewardedVideoAdCompleted = ->
    if isTest
      console.log 'onRewardedVideoAdCompleted'
    @has_reward = true

document.addEventListener "deviceready", setup, false
