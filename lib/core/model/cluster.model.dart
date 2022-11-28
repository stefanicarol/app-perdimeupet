class ClusterMaster {
  List<int>? centroid;
  List<dynamic>? cluster;
  List<int>? clusterInd;

  ClusterMaster({this.centroid, this.cluster, this.clusterInd});

  ClusterMaster.fromJson(Map<String, dynamic> json) {
    centroid = json['centroid'].cast<int>();
    cluster = json['cluster'].cast<int>();
    clusterInd = json['clusterInd'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['centroid'] = centroid;
    data['cluster'] = cluster;
    data['clusterInd'] = clusterInd;
    return data;
  }
}
