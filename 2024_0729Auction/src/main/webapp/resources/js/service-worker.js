/**
 * 
 */

 self.addEventListener('push', function(event) {
    var options = {
        body: event.data ? event.data.text() : '해당 입찰건이 완료되었습니다.',
        icon: '../resources/images/디션.png', // 알림 아이콘
        badge: '../resources/images/디션.png' // 배지 아이콘
    };

    event.waitUntil(
        self.registration.showNotification('입찰 성공 알림', options)
    );
});