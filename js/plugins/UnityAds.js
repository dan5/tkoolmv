// Generated by CoffeeScript 1.9.1
(function() {
  var CordovaUnityAdsMV, gameId, isTest, rewardedVideoAdPlacementId, setup, videoAdPlacementId;

  gameId = '42517';

  videoAdPlacementId = 'defaultZone';

  rewardedVideoAdPlacementId = 'rewardedVideoZone';

  isTest = true;

  if (window.unityads == null) {
    window.unityads = {
      showVideoAd: function() {},
      showRewardedVideoAd: function() {},
      loadedVideoAd: function() {
        return false;
      },
      loadedRewardedVideoAd: function() {
        return false;
      },
      isShowingVideoAd: function() {
        return false;
      },
      isShowingRewardedVideoAd: function() {
        return false;
      }
    };
  }

  CordovaUnityAdsMV = (function() {
    function CordovaUnityAdsMV() {
      this.status = null;
      this.has_reward = false;
    }

    CordovaUnityAdsMV.prototype.showVideoAd = function() {
      if (this.loadedVideoAd()) {
        window.unityads.showVideoAd();
        return this.status = 'isReady';
      } else {
        return console.log('not loadedVideoAd');
      }
    };

    CordovaUnityAdsMV.prototype.showRewardedVideoAd = function() {
      if (this.loadedRewardedVideoAd()) {
        window.unityads.showRewardedVideoAd();
        return this.status = 'isReady';
      } else {
        return console.log('not loadedRewardedVideoAd');
      }
    };

    CordovaUnityAdsMV.prototype.loadedVideoAd = function() {
      return window.unityads.loadedVideoAd();
    };

    CordovaUnityAdsMV.prototype.loadedRewardedVideoAd = function() {
      return window.unityads.loadedRewardedVideoAd();
    };

    CordovaUnityAdsMV.prototype.isShowingVideoAd = function() {
      return window.unityads.isShowingVideoAd();
    };

    CordovaUnityAdsMV.prototype.isShowingRewardedVideoAd = function() {
      return window.unityads.isShowingRewardedVideoAd();
    };

    CordovaUnityAdsMV.prototype.isShowing = function() {
      return this.status !== null;
    };

    CordovaUnityAdsMV.prototype.hasReward = function() {
      return this.has_reward;
    };

    CordovaUnityAdsMV.prototype.clearReward = function() {
      return this.has_reward = false;
    };

    return CordovaUnityAdsMV;

  })();

  window.UnityAdsMV = new CordovaUnityAdsMV();

  setup = function() {
    window.unityads.setUp(gameId, videoAdPlacementId, rewardedVideoAdPlacementId, isTest);
    window.unityads.onVideoAdLoaded = function() {
      if (isTest) {
        return console.log('onVideoAdLoaded');
      }
    };
    window.unityads.onVideoAdShown = function() {
      if (isTest) {
        console.log('onVideoAdShown');
      }
      return window.UnityAdsMV.status = 'isShowing';
    };
    window.unityads.onVideoAdHidden = function() {
      if (isTest) {
        console.log('onVideoAdHidden');
      }
      return window.UnityAdsMV.status = null;
    };
    window.unityads.onRewardedVideoAdLoaded = function() {
      if (isTest) {
        return console.log('onRewardedVideoAdLoaded');
      }
    };
    window.unityads.onRewardedVideoAdShown = function() {
      if (isTest) {
        console.log('onRewardedVideoAdShown');
      }
      return window.UnityAdsMV.status = 'isShowing';
    };
    window.unityads.onRewardedVideoAdHidden = function() {
      if (isTest) {
        console.log('onRewardedVideoAdHidden');
      }
      return window.UnityAdsMV.status = null;
    };
    return window.unityads.onRewardedVideoAdCompleted = function() {
      if (isTest) {
        console.log('onRewardedVideoAdCompleted');
      }
      return this.has_reward = true;
    };
  };

  document.addEventListener("deviceready", setup, false);

}).call(this);
