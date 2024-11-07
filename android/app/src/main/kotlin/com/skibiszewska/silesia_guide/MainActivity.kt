package com.skibiszewska.silesia_guide

import android.os.Bundle
import android.widget.ImageView
import android.widget.VideoView
import android.net.Uri
import android.view.View
import android.view.ViewGroup
import android.view.ViewTreeObserver
import android.widget.FrameLayout
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    private lateinit var imageView: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val videoView = VideoView(this)
        val videoUri = Uri.parse("android.resource://$packageName/${R.raw.film}")
        videoView.setVideoURI(videoUri)

        videoView.setOnPreparedListener { mediaPlayer ->
            mediaPlayer.isLooping = false
            videoView.start()
        }

        imageView = ImageView(this)
        imageView.setImageResource(R.drawable.logo_white)

        val initialWidth = (200 * resources.displayMetrics.density).toInt()
        val initialHeight = (200 * resources.displayMetrics.density).toInt()

        val layoutParams = FrameLayout.LayoutParams(initialWidth, initialHeight)

        imageView.layoutParams = layoutParams

        addContentView(videoView, ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        ))

        addContentView(imageView, layoutParams)


        videoView.viewTreeObserver.addOnGlobalLayoutListener(object : ViewTreeObserver.OnGlobalLayoutListener {
            override fun onGlobalLayout() {

                val x = (videoView.width - imageView.width) / 2
                val y = videoView.height * 0.27f
                imageView.x = x.toFloat()
                imageView.y = y.toFloat()

                videoView.viewTreeObserver.removeOnGlobalLayoutListener(this)
            }
        })

        videoView.setOnCompletionListener {
            videoView.visibility = View.GONE
            imageView.setImageResource(R.drawable.logo_slaskie)

            val smallerWidth = (100 * resources.displayMetrics.density).toInt()
            val smallerHeight = (100 * resources.displayMetrics.density).toInt()

            val smallerLayoutParams = FrameLayout.LayoutParams(smallerWidth, smallerHeight)
            imageView.layoutParams = smallerLayoutParams

            imageView.viewTreeObserver.addOnGlobalLayoutListener(object : ViewTreeObserver.OnGlobalLayoutListener {
                override fun onGlobalLayout() {

                    val x = (videoView.width - imageView.width) / 2
                    val y = (videoView.height - imageView.height) / 2

                    imageView.x = x.toFloat()
                    imageView.y = y.toFloat()

                    imageView.viewTreeObserver.removeOnGlobalLayoutListener(this)
                }
            })

            imageView.animate().y(80f).setDuration(500).start()
        }
    }
}