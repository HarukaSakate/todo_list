document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.todo-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', (event) => {
            const todoId = event.target.dataset.id;
            const completed = event.target.checked;
    
            fetch(`/todos/${todoId}`, {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
                },
                body: JSON.stringify({ todo: { completed } })
            });
        });
    });
});