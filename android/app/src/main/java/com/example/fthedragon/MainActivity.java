package com.example.fthedragon;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import android.os.Bundle;
import android.content.Intent;
import android.net.Uri;
import android.app.Activity;
import java.util.*;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.flutter.epic/epic";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {

  super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler(
            (call, result) ->{
                final String name= call.arguments();
                if(call.method.equals("appUninstall")){
                    Uri packageUri = Uri.parse("package:"+name);
                    Intent uninstallIntent=new Intent(Intent.ACTION_DELETE,packageUri);
                    startActivity(uninstallIntent);
                    result.success("success");
                }
           }
        );
  }
}

