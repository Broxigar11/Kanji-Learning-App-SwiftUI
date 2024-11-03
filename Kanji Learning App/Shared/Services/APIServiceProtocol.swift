//
//  APIServiceProtocol.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 30..
//
	
protocol APIServiceProtocol {
    func fetchData<T: Decodable>(from urlString: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
