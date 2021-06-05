$(function () {
    $("a").click(function (e) {
        e.preventDefault();
        if (e.target["id"] === "deleteStudent") {
            const objDeleted = (e.target["id"] === "deleteStudent" ? "student" : "course");
            bootbox.confirm({
                centerVertical: true,
                closeButton: false,
                title: 'Delete?',
                message: 'Are you sure you want to <b>delete</b> this ' + objDeleted,
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-danger'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-primary'
                    }
                },
                callback: function (result) {
                    if(result){
                     window.location.href = e.target["href"];   
                    }
                }
            });
        } else {
            window.location.href = e.target["href"];   
        }
    });
});


