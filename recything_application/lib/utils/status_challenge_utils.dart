class StatusChallengeUtils {
  static String getStatus(String statusProgress, String statusAccept) {
    if (statusProgress == 'in_progress') {
      return 'Proses';
    } else {
      switch (statusAccept) {
        case 'accept':
          return 'Terverifikasi';
        case 'need_rivew':
          return 'Menunggu';
        case 'reject':
          return 'Ditolak';
        default:
          return 'Unknown';
      }
    }
  }
}