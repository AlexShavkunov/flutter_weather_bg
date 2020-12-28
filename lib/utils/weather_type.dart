import 'package:flutter/cupertino.dart';

/// 目前有15种天气类型
enum WeatherType {
  heavyRainy,
  heavySnow,
  middleSnow,
  thunder,
  lightRainy,
  lightSnow,
  sunnyNight,
  sunny,
  cloudy,
  cloudyNight,
  middleRainy,
  overcast,
  hazy, // 霾
  foggy, // 雾
  dusty, // 浮尘
}

/// 数据加载状态
enum WeatherDataState {
  /// 初始化
  init,

  /// 正在加载
  loading,

  /// 加载结束
  finish,
}

/// 天气的相关工具类
class WeatherUtil {
  static bool isSnowRain(WeatherType weatherType) {
    return isRainy(weatherType) || isSnow(weatherType);
  }

  /// 判断是否下雨，小中大包括雷暴，都是属于雨的类型
  static bool isRainy(WeatherType weatherType) {
    return weatherType == WeatherType.lightRainy ||
        weatherType == WeatherType.middleRainy ||
        weatherType == WeatherType.heavyRainy ||
        weatherType == WeatherType.thunder;
  }

  /// 判断是否下雪
  static bool isSnow(WeatherType weatherType) {
    return weatherType == WeatherType.lightSnow ||
        weatherType == WeatherType.middleSnow ||
        weatherType == WeatherType.heavySnow;
  }

  // 根据天气类型获取背景的颜色值
  static List<Color> getColor(WeatherType weatherType) {
    return [Colors.transparent, Colors.transparent];
  }

  // 根据天气类型获取天气的描述信息
  static String getWeatherDesc(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.sunny:
      case WeatherType.sunnyNight:
        return "晴";
      case WeatherType.cloudy:
      case WeatherType.cloudyNight:
        return "多云";
      case WeatherType.overcast:
        return "阴";
      case WeatherType.lightRainy:
        return "小雨";
      case WeatherType.middleRainy:
        return "中雨";
      case WeatherType.heavyRainy:
        return "大雨";
      case WeatherType.thunder:
        return "雷阵雨";
      case WeatherType.hazy:
        return "雾";
      case WeatherType.foggy:
        return "霾";
      case WeatherType.lightSnow:
        return "小雪";
      case WeatherType.middleSnow:
        return "中雪";
      case WeatherType.heavySnow:
        return "大雪";
      case WeatherType.dusty:
        return "浮尘";
      default:
        return "晴";
    }
  }
}
