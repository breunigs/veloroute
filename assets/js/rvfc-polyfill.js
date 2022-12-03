if (!('requestVideoFrameCallback' in HTMLVideoElement.prototype)) {
  HTMLVideoElement.prototype._rvfcpolyfillmap = {}
  HTMLVideoElement.prototype.requestVideoFrameCallback = function (callback) {
    const quality = this.getVideoPlaybackQuality()
    const baseline = quality.totalVideoFrames - quality.droppedVideoFrames

    const check = (old, now) => {
      const newquality = this.getVideoPlaybackQuality()
      const presentedFrames = newquality.totalVideoFrames - newquality.droppedVideoFrames
      if (presentedFrames > baseline) {
        const timediff = now - old
        callback(now, {
          mediaTime: Math.max(0, this.currentTime || 0) + timediff / 1000
        })
        delete this._rvfcpolyfillmap[now]
      } else {
        this._rvfcpolyfillmap[now] = requestAnimationFrame(newer => check(now, newer))
      }
    }

    const now = performance.now()
    this._rvfcpolyfillmap[now] = requestAnimationFrame(newer => check(now, newer))
    return now
  }

  HTMLVideoElement.prototype.cancelVideoFrameCallback = function (now) {
    cancelAnimationFrame(this._rvfcpolyfillmap[now])
    delete this._rvfcpolyfillmap[now]
  }
}
