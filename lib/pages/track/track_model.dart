class TrackModel {
  final String? szInternalId;
  final String? szDate;
  final String? szTime;
  final String? szLocation;
  final String? szGeoLocation;
  final String? szGeoLocationString;
  final String? szZoneInfo;
  final String? szCaseID;
  final String? szDirection;
  final String? sztourID;
  TrackModel({
    required this.szInternalId,
    required this.szDate,
    required this.szTime,
    required this.szLocation,
    required this.szGeoLocation,
    required this.szGeoLocationString,
    required this.szZoneInfo,
    required this.szCaseID,
    required this.szDirection,
    required this.sztourID,
  });

  TrackModel copyWith({
    String? szInternalId,
    String? szDate,
    String? szTime,
    String? szLocation,
    String? szGeoLocation,
    String? szGeoLocationString,
    String? szZoneInfo,
    String? szCaseID,
    String? szDirection,
    String? sztourID,
  }) {
    return TrackModel(
      szInternalId: szInternalId ?? this.szInternalId,
      szDate: szDate ?? this.szDate,
      szTime: szTime ?? this.szTime,
      szLocation: szLocation ?? this.szLocation,
      szGeoLocation: szGeoLocation ?? this.szGeoLocation,
      szGeoLocationString: szGeoLocationString ?? this.szGeoLocationString,
      szZoneInfo: szZoneInfo ?? this.szZoneInfo,
      szCaseID: szCaseID ?? this.szCaseID,
      szDirection: szDirection ?? this.szDirection,
      sztourID: sztourID ?? this.sztourID,
    );
  }

  factory TrackModel.fromMap(Map<String, dynamic> map) {
    return TrackModel(
      szInternalId: map['internalID'] != null ? map['internalID'] as String : '?',
      szDate: map['date'] != null ? map['date'] as String : '?',
      szTime: map['time'] != null ? map['time'] as String : '?',
      szLocation: map['location'] != null ? map['location'] as String : '?',
      szGeoLocation: map['geoLocation'] != null ? map['geoLocation'] as String: '?',
      szGeoLocationString:
          map['geoLocationString'] != null ? map['geoLocationString'] as String: '?',
      szZoneInfo: map['zoneInfo'] != null ? map['zoneInfo'] as String: '?',
      szCaseID: map['caseID'] != null ? map['caseID'] as String : '?',
      szDirection: map['direction'] != null ? map['direction'] as String: '?',
      sztourID: map['tourID'] != null ? map['tourID'] as String: '?',
    );
  }

  @override
  String toString() {
    return 'TrackModel(szInternalId: $szInternalId, szDate: $szDate, szTime: $szTime, szLocation: $szLocation, szGeoLocation: $szGeoLocation, szGeoLocationString: $szGeoLocationString, szZoneInfo: $szZoneInfo, szCaseID: $szCaseID, szDirection: $szDirection, sztourID: $sztourID)';
  }
}
