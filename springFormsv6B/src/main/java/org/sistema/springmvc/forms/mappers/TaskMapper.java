package org.sistema.springmvc.forms.mappers;

import org.sistema.springmvc.forms.dtos.TaskDTO;
import org.sistema.springmvc.forms.models.Task;
import org.sistema.springmvc.forms.models.User;

public class TaskMapper {

	public static Task toTask(TaskDTO taskDTO, User user) {
		Task task = new Task();
		task.setId(taskDTO.getId());
		task.setDescription(taskDTO.getDescription());
		task.setName(taskDTO.getName());
		task.setUser(user);
		return task;
	}

	public static TaskDTO toDTO(Task task) {
		TaskDTO taskDTO = new TaskDTO(task.getId(), task.getName(),
				task.getDescription(), task.getUser().getId(), task.getUser()
						.getLogin());
		return taskDTO;
	}

}
