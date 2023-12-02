class HomeInfo {
  HomeInfo({
    required this.id,
    required this.weather,
    required this.date,
    required this.contentList,
    required this.menu,
    required this.ad,
  });

  final String? id;
  final Weather? weather;
  final DateTime? date;
  final List<ContentList> contentList;
  final Menu? menu;
  final List<dynamic> ad;

  factory HomeInfo.fromJson(Map<String, dynamic> json){
    return HomeInfo(
      id: json["id"],
      weather: json["weather"] == null ? null : Weather.fromJson(json["weather"]),
      date: DateTime.tryParse(json["date"] ?? ""),
      contentList: json["content_list"] == null ? [] : List<ContentList>.from(json["content_list"]!.map((x) => ContentList.fromJson(x))),
      menu: json["menu"] == null ? null : Menu.fromJson(json["menu"]),
      ad: json["ad"] == null ? [] : List<dynamic>.from(json["ad"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "weather": weather?.toJson(),
    "date": date?.toIso8601String(),
    "content_list": contentList.map((x) => x?.toJson()).toList(),
    "menu": menu?.toJson(),
    "ad": ad.map((x) => x).toList(),
  };

}

class ContentList {
  ContentList({
    required this.id,
    required this.category,
    required this.displayCategory,
    required this.itemId,
    required this.title,
    required this.forward,
    required this.imgUrl,
    required this.likeCount,
    required this.postDate,
    required this.lastUpdateDate,
    required this.author,
    required this.videoUrl,
    required this.audioUrl,
    required this.audioPlatform,
    required this.startVideo,
    required this.hasReading,
    required this.volume,
    required this.picInfo,
    required this.wordsInfo,
    required this.textAuthorInfo,
    required this.subtitle,
    required this.number,
    required this.serialId,
    required this.serialList,
    required this.movieStoryId,
    required this.adId,
    required this.adType,
    required this.adPvurl,
    required this.adLinkurl,
    required this.adMakettime,
    required this.adClosetime,
    required this.adShareCnt,
    required this.adPvurlVendor,
    required this.contentId,
    required this.contentType,
    required this.contentBgcolor,
    required this.shareUrl,
    required this.shareInfo,
    required this.shareList,
    required this.tagList,
    required this.orientation,
    required this.answerer,
    required this.isRegular,
  });

  final String? id;
  final String? category;
  final num? displayCategory;
  final String? itemId;
  final String? title;
  final String? forward;
  final String? imgUrl;
  final num? likeCount;
  final DateTime? postDate;
  final String? lastUpdateDate;
  final Answerer? author;
  final String? videoUrl;
  final String? audioUrl;
  final num? audioPlatform;
  final String? startVideo;
  final num? hasReading;
  final dynamic? volume;
  final String? picInfo;
  final String? wordsInfo;
  final TextAuthorInfo? textAuthorInfo;
  final String? subtitle;
  final num? number;
  final int? serialId;
  final List<dynamic> serialList;
  final int? movieStoryId;
  final int? adId;
  final num? adType;
  final String? adPvurl;
  final String? adLinkurl;
  final String? adMakettime;
  final String? adClosetime;
  final String? adShareCnt;
  final String? adPvurlVendor;
  final String? contentId;
  final String? contentType;
  final String? contentBgcolor;
  final String? shareUrl;
  final ShareInfo? shareInfo;
  final ShareList? shareList;
  final List<dynamic> tagList;
  final String? orientation;
  final Answerer? answerer;
  final String? isRegular;

  factory ContentList.fromJson(Map<String, dynamic> json){
    return ContentList(
      id: json["id"],
      category: json["category"],
      displayCategory: json["display_category"],
      itemId: json["item_id"],
      title: json["title"],
      forward: json["forward"],
      imgUrl: json["img_url"],
      likeCount: json["like_count"],
      postDate: DateTime.tryParse(json["post_date"] ?? ""),
      lastUpdateDate: json["last_update_date"],
      author: json["author"] == null ? null : Answerer.fromJson(json["author"]),
      videoUrl: json["video_url"],
      audioUrl: json["audio_url"],
      audioPlatform: json["audio_platform"],
      startVideo: json["start_video"],
      hasReading: json["has_reading"],
      volume: json["volume"],
      picInfo: json["pic_info"],
      wordsInfo: json["words_info"],
      textAuthorInfo: json["text_author_info"] == null ? null : TextAuthorInfo.fromJson(json["text_author_info"]),
      subtitle: json["subtitle"],
      number: json["number"],
      serialId: json["serial_id"],
      serialList: json["serial_list"] == null ? [] : List<dynamic>.from(json["serial_list"]!.map((x) => x)),
      movieStoryId: json["movie_story_id"],
      adId: json["ad_id"],
      adType: json["ad_type"],
      adPvurl: json["ad_pvurl"],
      adLinkurl: json["ad_linkurl"],
      adMakettime: json["ad_makettime"],
      adClosetime: json["ad_closetime"],
      adShareCnt: json["ad_share_cnt"],
      adPvurlVendor: json["ad_pvurl_vendor"],
      contentId: json["content_id"],
      contentType: json["content_type"],
      contentBgcolor: json["content_bgcolor"],
      shareUrl: json["share_url"],
      shareInfo: json["share_info"] == null ? null : ShareInfo.fromJson(json["share_info"]),
      shareList: json["share_list"] == null ? null : ShareList.fromJson(json["share_list"]),
      tagList: json["tag_list"] == null ? [] : List<dynamic>.from(json["tag_list"]!.map((x) => x)),
      orientation: json["orientation"],
      answerer: json["answerer"] == null ? null : Answerer.fromJson(json["answerer"]),
      isRegular: json["is_regular"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "display_category": displayCategory,
    "item_id": itemId,
    "title": title,
    "forward": forward,
    "img_url": imgUrl,
    "like_count": likeCount,
    "post_date": postDate?.toIso8601String(),
    "last_update_date": lastUpdateDate,
    "author": author?.toJson(),
    "video_url": videoUrl,
    "audio_url": audioUrl,
    "audio_platform": audioPlatform,
    "start_video": startVideo,
    "has_reading": hasReading,
    "volume": volume,
    "pic_info": picInfo,
    "words_info": wordsInfo,
    "text_author_info": textAuthorInfo?.toJson(),
    "subtitle": subtitle,
    "number": number,
    "serial_id": serialId,
    "serial_list": serialList.map((x) => x).toList(),
    "movie_story_id": movieStoryId,
    "ad_id": adId,
    "ad_type": adType,
    "ad_pvurl": adPvurl,
    "ad_linkurl": adLinkurl,
    "ad_makettime": adMakettime,
    "ad_closetime": adClosetime,
    "ad_share_cnt": adShareCnt,
    "ad_pvurl_vendor": adPvurlVendor,
    "content_id": contentId,
    "content_type": contentType,
    "content_bgcolor": contentBgcolor,
    "share_url": shareUrl,
    "share_info": shareInfo?.toJson(),
    "share_list": shareList?.toJson(),
    "tag_list": tagList.map((x) => x).toList(),
    "orientation": orientation,
    "answerer": answerer?.toJson(),
    "is_regular": isRegular,
  };

}

class Answerer {
  Answerer({
    required this.userId,
    required this.userName,
    required this.desc,
    required this.wbName,
    required this.isSettled,
    required this.settledType,
    required this.summary,
    required this.fansTotal,
    required this.webUrl,
  });

  final String? userId;
  final String? userName;
  final String? desc;
  final String? wbName;
  final String? isSettled;
  final String? settledType;
  final String? summary;
  final String? fansTotal;
  final String? webUrl;

  factory Answerer.fromJson(Map<String, dynamic> json){
    return Answerer(
      userId: json["user_id"],
      userName: json["user_name"],
      desc: json["desc"],
      wbName: json["wb_name"],
      isSettled: json["is_settled"],
      settledType: json["settled_type"],
      summary: json["summary"],
      fansTotal: json["fans_total"],
      webUrl: json["web_url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "desc": desc,
    "wb_name": wbName,
    "is_settled": isSettled,
    "settled_type": settledType,
    "summary": summary,
    "fans_total": fansTotal,
    "web_url": webUrl,
  };

}

class ShareInfo {
  ShareInfo({
    required this.url,
    required this.image,
    required this.title,
    required this.content,
  });

  final String? url;
  final String? image;
  final String? title;
  final String? content;

  factory ShareInfo.fromJson(Map<String, dynamic> json){
    return ShareInfo(
      url: json["url"],
      image: json["image"],
      title: json["title"],
      content: json["content"],
    );
  }

  Map<String, dynamic> toJson() => {
    "url": url,
    "image": image,
    "title": title,
    "content": content,
  };

}

class ShareList {
  ShareList({
    required this.wx,
    required this.wxTimeline,
    required this.weibo,
    required this.qq,
  });

  final Qq? wx;
  final Qq? wxTimeline;
  final Qq? weibo;
  final Qq? qq;

  factory ShareList.fromJson(Map<String, dynamic> json){
    return ShareList(
      wx: json["wx"] == null ? null : Qq.fromJson(json["wx"]),
      wxTimeline: json["wx_timeline"] == null ? null : Qq.fromJson(json["wx_timeline"]),
      weibo: json["weibo"] == null ? null : Qq.fromJson(json["weibo"]),
      qq: json["qq"] == null ? null : Qq.fromJson(json["qq"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "wx": wx?.toJson(),
    "wx_timeline": wxTimeline?.toJson(),
    "weibo": weibo?.toJson(),
    "qq": qq?.toJson(),
  };

}

class Qq {
  Qq({
    required this.title,
    required this.desc,
    required this.link,
    required this.imgUrl,
    required this.audio,
  });

  final String? title;
  final String? desc;
  final String? link;
  final String? imgUrl;
  final String? audio;

  factory Qq.fromJson(Map<String, dynamic> json){
    return Qq(
      title: json["title"],
      desc: json["desc"],
      link: json["link"],
      imgUrl: json["imgUrl"],
      audio: json["audio"],
    );
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "desc": desc,
    "link": link,
    "imgUrl": imgUrl,
    "audio": audio,
  };

}

class TextAuthorInfo {
  TextAuthorInfo({
    required this.textAuthorName,
    required this.textAuthorWork,
    required this.textAuthorDesc,
  });

  final String? textAuthorName;
  final String? textAuthorWork;
  final String? textAuthorDesc;

  factory TextAuthorInfo.fromJson(Map<String, dynamic> json){
    return TextAuthorInfo(
      textAuthorName: json["text_author_name"],
      textAuthorWork: json["text_author_work"],
      textAuthorDesc: json["text_author_desc"],
    );
  }

  Map<String, dynamic> toJson() => {
    "text_author_name": textAuthorName,
    "text_author_work": textAuthorWork,
    "text_author_desc": textAuthorDesc,
  };

}

class Menu {
  Menu({
    required this.vol,
    required this.list,
  });

  final String? vol;
  final List<ListElement> list;

  factory Menu.fromJson(Map<String, dynamic> json){
    return Menu(
      vol: json["vol"],
      list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "vol": vol,
    "list": list.map((x) => x?.toJson()).toList(),
  };

}

class ListElement {
  ListElement({
    required this.contentType,
    required this.contentId,
    required this.title,
  });

  final String? contentType;
  final String? contentId;
  final String? title;

  factory ListElement.fromJson(Map<String, dynamic> json){
    return ListElement(
      contentType: json["content_type"],
      contentId: json["content_id"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
    "content_type": contentType,
    "content_id": contentId,
    "title": title,
  };

}

class Weather {
  Weather({
    required this.cityName,
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.climate,
    required this.windDirection,
    required this.hurricane,
    required this.icons,
  });

  final String? cityName;
  final DateTime? date;
  final String? temperature;
  final String? humidity;
  final String? climate;
  final String? windDirection;
  final String? hurricane;
  final Icons? icons;

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      cityName: json["city_name"],
      date: DateTime.tryParse(json["date"] ?? ""),
      temperature: json["temperature"],
      humidity: json["humidity"],
      climate: json["climate"],
      windDirection: json["wind_direction"],
      hurricane: json["hurricane"],
      icons: json["icons"] == null ? null : Icons.fromJson(json["icons"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "city_name": cityName,
    "date": "${date?.year.toString().padLeft(4,'0')}-${date?.month.toString().padLeft(2,'0')}-${date?.day.toString().padLeft(2,'0')}",
    "temperature": temperature,
    "humidity": humidity,
    "climate": climate,
    "wind_direction": windDirection,
    "hurricane": hurricane,
    "icons": icons?.toJson(),
  };

}

class Icons {
  Icons({
    required this.day,
    required this.night,
  });

  final String? day;
  final String? night;

  factory Icons.fromJson(Map<String, dynamic> json){
    return Icons(
      day: json["day"],
      night: json["night"],
    );
  }

  Map<String, dynamic> toJson() => {
    "day": day,
    "night": night,
  };

}
