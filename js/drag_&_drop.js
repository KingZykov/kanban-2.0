// document.querySelectorAll('.list-group-item').forEach(item => {
//     item.addEventListener('dragstart', function(e) {
//         e.dataTransfer.setData('text/plain', e.target.id);
//     });
// });

// // Определяем обработчики для всех элементов с классом 'drop-zone'
// document.querySelectorAll('.drop-zone').forEach(zone => {
//     zone.addEventListener('dragover', function(e) {
//         e.preventDefault(); // Необходимо для возможности выпустить элемент
//     });

//     zone.addEventListener('drop', function(e) {
//         e.preventDefault();
//         const id = e.dataTransfer.getData('text/plain');
//         const draggableElement = document.getElementById(id);
//         this.appendChild(draggableElement);
        
//         // Предположим, что id элемента содержит id задачи в формате "task-123"
//         const taskId = id.split('-')[1];
//         const newStatus = this.getAttribute('task-status');  // Убедитесь, что у drop-zone есть атрибут task-status

//         // AJAX запрос для обновления статуса задачи в БД
//         fetch('../administration/projects.php', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/x-www-form-urlencoded',
//             },
//             body: `id_task=${taskId}&new_status=${newStatus}`
//         })
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error('Network response was not ok');
//             }
//             return response.json();
//         })
//         .then(data => {
//             console.log('Success:', data);
//         })
//         .catch((error) => {
//             console.error('Error:', error);
//         });
        
//     });
// });




/// 2 версия
// document.querySelectorAll('.list-group-item').forEach(item => {
//     item.addEventListener('dragstart', function(e) {
//         e.dataTransfer.setData('text/plain', this.getAttribute('data-task-id'));
//     });
// });

// document.querySelectorAll('.drop-zone').forEach(zone => {
//     zone.addEventListener('dragover', function(e) {
//         e.preventDefault(); // Это позволяет перетаскиваемым элементам быть сброшенными
//     });

//     zone.addEventListener('drop', function(e) {
//         e.preventDefault();
//         const taskId = e.dataTransfer.getData('text/plain');
//         const draggableElement = document.querySelector(`[data-task-id="${taskId}"]`);
//         this.appendChild(draggableElement);

//         const newStatus = this.getAttribute('task-status'); // Убедитесь, что у drop-zone есть атрибут task-status

//         // AJAX запрос для обновления статуса задачи в базе данных
//         fetch('C:/ospanel/domains/kanban/administration/projects.php', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/x-www-form-urlencoded',
//             },
//             body: `id_task=${taskId}&new_status=${newStatus}`
        
//         })
//         .then(response => response.json()) // Парсинг ответа сервера как JSON
//         .then(data => {
//             console.log('Server Response:', data); // Вывод ответа сервера в консоль
//         })
//         .catch(error => {
//             console.error('Fetch Error:', error); // Обработка возможных ошибок
        
        
        
        
//         });
        
        
//     });
// });


/// 3 версия

document.querySelectorAll('.list-group-item').forEach(item => {
    item.addEventListener('dragstart', function(e) {
        e.dataTransfer.setData('text/plain', this.getAttribute('data-task-id'));
        console.log('Drag Start - Task ID:', this.getAttribute('data-task-id')); // Вывод ID задачи при начале перетаскивания
    });
});

document.querySelectorAll('.drop-zone').forEach(zone => {
    zone.addEventListener('dragover', function(e) {
        e.preventDefault(); // Это позволяет перетаскиваемым элементам быть сброшенными
        console.log('Drag Over - Zone:', this); // Вывод информации о зоне перетаскивания
    });

    zone.addEventListener('drop', function(e) {
        e.preventDefault();
        const taskId = e.dataTransfer.getData('text/plain');
        const draggableElement = document.querySelector(`[data-task-id="${taskId}"]`);
        this.appendChild(draggableElement);

        const newStatus = this.getAttribute('task-status'); // Убедитесь, что у drop-zone есть атрибут task-status
        console.log('Drop - Task ID:', taskId, 'New Status:', newStatus, 'Zone:', this); // Вывод информации о событии drop
        $.ajax({
            type: "POST",
            url: "projects.php",
            data: {
                "query": "send",
                "taskId": taskId, // добавляем taskId в данные запроса
                "newStatus": newStatus // добавляем newStatus в данные запроса
            },
            success: function(response) {
                // обработка успешного ответа от сервера
                console.log('Сервер ответил:', response);
                location.reload();
            },
            error: function(xhr, status, error) {
                // обработка ошибки при выполнении запроса
                console.error('Произошла ошибка:', error);
            }
        });
    
    });
});

