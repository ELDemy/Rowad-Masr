package com.depi.android;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity{
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.e("MainActivity", "onCreate");
        Button StartCalculator =findViewById(R.id.calculatorView_btn);
        StartCalculator.setOnClickListener((new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this,CalculatorActivity.class);
                startActivity(intent);
            }
        }));
    }

}
