package com.skibiszewska.silesia_guide

import android.os.Bundle
import android.widget.TextView
import android.widget.VideoView
import android.net.Uri
import android.view.View
import android.view.ViewGroup
import android.graphics.Typeface
import android.graphics.Color
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    private lateinit var textView: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        val videoView = VideoView(this)
        val videoUri = Uri.parse("android.resource://$packageName/${R.raw.film}")

        videoView.setVideoURI(videoUri)
        videoView.setOnPreparedListener { mediaPlayer ->
            mediaPlayer.isLooping = false
            videoView.start()
        }

        videoView.setOnCompletionListener {
            videoView.visibility = View.GONE
            textView.animate().y(140f).setDuration(500).start()
            textView.setTextColor(Color.parseColor("#106BAE"))
            textView.textSize = 30f
        }

        textView = TextView(this)
        textView.text = "Śląskie."
        textView.textSize = 40f
        textView.setTypeface(null, Typeface.BOLD)
        textView.setTextColor(resources.getColor(android.R.color.white))

        addContentView(videoView, ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        ))

        addContentView(textView, ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        ))

        videoView.viewTreeObserver.addOnGlobalLayoutListener {
            val x = (videoView.width - textView.width) / 2
            val y = videoView.height * 0.75f
            textView.x = x.toFloat()
            textView.y = y.toFloat()
        }
    }
}