package com.example.iron_kids;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    private String searchText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        String action = intent.getAction();
        String type = intent.getType();

        //if (Intent.ACTION_SEND.equals(action) && type != null) {
        //    if ("text/plain".equals(type)) {
                searchText = intent.getStringExtra(Intent.EXTRA_TEXT);// Handle text being sent
        //    }
        //}
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "app.channel.shared.data")
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.contentEquals("getSearchText")) {
                                result.success(searchText);
                                searchText = null;
                            }
                        }
                );
    }

}