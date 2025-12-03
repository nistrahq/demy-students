//
//  ScheduleMapper.swift
//  DemyStudents
//

import Foundation

enum ScheduleMapper {
    static func fromDTO(_ dto: ScheduleDTO) -> Schedule {
        Schedule(
            id: dto.id,
            name: dto.name,
            classSessions: dto.classSessions.map(ClassSessionMapper.fromDTO)
        )
    }
}

enum ClassSessionMapper {
    static func fromDTO(_ dto: ClassSessionDTO) -> ClassSession {
        ClassSession(
            id: dto.id,
            startTime: dto.startTime,
            endTime: dto.endTime,
            dayOfWeek: DayOfWeek(rawValue: dto.dayOfWeek) ?? .MONDAY,
            course: CourseMapper.fromDTO(dto.course),
            classroom: ClassroomMapper.fromDTO(dto.classroom),
            teacher: TeacherMapper.fromDTO(dto.teacher)
        )
    }
}

enum CourseMapper {
    static func fromDTO(_ dto: CourseDTO) -> Course {
        Course(
            id: dto.id,
            name: dto.name,
            code: dto.code,
            description: dto.description
        )
    }
}

enum ClassroomMapper {
    static func fromDTO(_ dto: ClassroomDTO) -> Classroom {
        Classroom(
            id: dto.id,
            code: dto.code,
            capacity: dto.capacity,
            campus: dto.campus
        )
    }
}

enum TeacherMapper {
    static func fromDTO(_ dto: TeacherDTO) -> Teacher {
        Teacher(
            id: dto.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            emailAddress: dto.emailAddress,
            countryCode: dto.countryCode,
            phoneNumber: dto.phoneNumber,
            academyId: dto.academyId
        )
    }
}
