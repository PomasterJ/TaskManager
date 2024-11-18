package com.taskmanagement.task_manager.service;

import com.taskmanagement.task_manager.entity.Task;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TaskService {

    public Task createTask(Task task);

    public List<Task> getAllTasks();

    public void completeTask(Long id);

    public void deleteTask(Long id);
}
