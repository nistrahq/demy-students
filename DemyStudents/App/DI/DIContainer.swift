//
//  DIContainer.swift
//  DemyStudents
//
//  Created by Salim Ramirez Mestanza on 18/11/25.
//

final class DIContainer {
    static let shared = DIContainer()
    
    private init() {}
    
    let keychain = KeychainStorage()
    
    lazy var httpClient: HTTPClient = {
        HTTPClient(keychain: keychain)
    }()
    
    lazy var authRemoteDataSource: AuthRemoteDataSource = {
        AuthRemoteDataSourceImpl(client: httpClient)
    }()
    
    lazy var authRepository: AuthRepository = {
        AuthRepositoryImpl(
            remote: authRemoteDataSource,
            keychain: keychain
        )
    }()

    lazy var signInUseCase: SignInUseCase = {
        SignInUseCase(repository: authRepository)
    }()
    
    // MARK: - Home
    lazy var homeRemoteDataSource: HomeRemoteDataSource = {
        HomeRemoteDataSourceImpl(client: httpClient)
    }()
    
    // MARK: - Schedule
    lazy var scheduleRemoteDataSource: ScheduleRemoteDataSource = {
        ScheduleRemoteDataSourceImpl(client: httpClient)
    }()
    
    lazy var scheduleRepository: ScheduleRepository = {
        ScheduleRepositoryImpl(remote: scheduleRemoteDataSource)
    }()
    
    lazy var getScheduleUseCase: GetScheduleUseCase = {
        GetScheduleUseCase(repository: scheduleRepository)
    }()
}
