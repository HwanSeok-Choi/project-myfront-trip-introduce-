document.addEventListener('DOMContentLoaded', function () {
    const subtitles = document.querySelectorAll('.idfg_h2_1,.idfg_h2_2');
    const forms = document.querySelectorAll('.idfg_form');


     // 처음 로드될 때 첫 번째 소제목과 폼을 활성화
     if (subtitles.length > 0 && forms.length > 0) {
        subtitles[0].classList.add('active');
        forms[0].classList.add('active');
    }

    subtitles.forEach(subtitle => {
        subtitle.addEventListener('click', function () {
            // 모든 소제목에서 active 클래스 제거
            subtitles.forEach(sub => sub.classList.remove('active'));
            
            // 클릭한 소제목에 active 클래스 추가
            this.classList.add('active');

            // 모든 폼을 숨김
            forms.forEach(form => form.classList.remove('active'));
            
            // 클릭한 소제목에 해당하는 폼을 표시
            const formId = this.getAttribute('data-form');
            document.getElementById(formId).classList.add('active');

              // border-bottom 설정
              if (formId === 'form2') {
                // 두 번째 소제목의 border-bottom 제거
                this.style.borderBottom = 'none';
                
                // 첫 번째 소제목의 border-bottom 추가
                if (subtitles[0]) {
                    subtitles[0].style.borderBottom = '1px solid black'; // 원하는 스타일로 변경 가능
                }
            } else {
                // 첫 번째 소제목이 클릭된 경우 스타일 초기화
                this.style.borderBottom = ''; // 원하는 스타일로 변경 가능
                if (subtitles[1]) {
                    subtitles[1].style.borderBottom = ''; // 원래 스타일로 되돌림
                }
            }
        });
    });
});
