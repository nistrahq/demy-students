//
//  HomeRepository.swift
//  DemyStudents
//
//  Created by Alumnos on 29/11/25.
//

protocol HomeRepository {
    func getCurrentStudent() async throws -> Student
}
