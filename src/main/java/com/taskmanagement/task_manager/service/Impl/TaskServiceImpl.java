package com.taskmanagement.task_manager.service.Impl;

import com.taskmanagement.task_manager.entity.Task;
import com.taskmanagement.task_manager.repository.TaskRepository;
import com.taskmanagement.task_manager.service.TaskService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Override
    public Task createTask(Task task) {
        return taskRepository.save(task);
    }

    @Override
    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    @Transactional
    @Override
    public void completeTask(Long id) {
        Optional<Task> taskOptional = taskRepository.findById(id);

        if (taskOptional.isEmpty()) {
            throw new RuntimeException("Task not found");
        }

        Task task = taskOptional.get();
        task.setStatus(Task.Status.COMPLETED);
        taskRepository.save(task);

        markSubtasksAsCompleted(task);

        markParentTaskAsCompletedIfNeeded(task);
    }

    @Transactional
    @Override
    public void deleteTask(Long id) {
        Optional<Task> taskOptional = taskRepository.findById(id);

        if (taskOptional.isEmpty()) {
            throw new RuntimeException("Task not found");
        }

        Task task = taskOptional.get();

        deleteSubtasks(task);

        taskRepository.delete(task);
    }

    private void markSubtasksAsCompleted(Task parentTask) {
        List<Task> subtasks = parentTask.getSubtasks();
        for (Task subtask : subtasks) {
            subtask.setStatus(Task.Status.COMPLETED);
            taskRepository.save(subtask);
            markSubtasksAsCompleted(subtask);
        }
    }

    private void markParentTaskAsCompletedIfNeeded(Task task) {
        if (task.getParentTaskId() == null) {
            return;
        }

        Optional<Task> parentTask = taskRepository.findById(task.getParentTaskId());

        if (parentTask.isEmpty()) {
            return;
        }
        boolean allSubtasksCompleted = checkAllSubtasksCompleted(parentTask.orElse(null));

        if (allSubtasksCompleted) {
            parentTask.get().setStatus(Task.Status.COMPLETED);
            taskRepository.save(parentTask.get());

            markParentTaskAsCompletedIfNeeded(parentTask.orElse(null));
        }
    }

    private boolean checkAllSubtasksCompleted(Task parentTask) {
        List<Task> subtasks = taskRepository.findByParentTaskId(parentTask.getId());
        return subtasks.stream().allMatch(subtask -> subtask.getStatus().equals(Task.Status.COMPLETED));
    }

    private void deleteSubtasks(Task parentTask) {
        List<Task> subtasks = parentTask.getSubtasks();
        for (Task subtask : subtasks) {
            deleteSubtasks(subtask);
            taskRepository.delete(subtask);
        }
    }
}
